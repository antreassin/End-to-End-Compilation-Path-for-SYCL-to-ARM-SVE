# python3 -m venv venv
# source venv/bin/activate
# pip install matplotlib numpy
import os
import glob
import subprocess
import csv
import statistics
import numpy as np
from collections import defaultdict
import matplotlib.pyplot as plt

base_dir = os.getcwd()
exec_dirs = [d for d in os.listdir('.') if os.path.isdir(d) and d.endswith('_arm_executables')]

if not exec_dirs:
    print("No directories ending in '_arm_executables' found. Exiting.")
    exit()

# Dictionary to hold all data globally: 
# global_data[config_type][benchmark_name][problem_size] = [time1, time2, ...]
global_data = defaultdict(lambda: defaultdict(lambda: defaultdict(list)))

def get_config_type(exe_name):
    name_lower = exe_name.lower()
    if 'polly' in name_lower:
        return 'Polly'
    elif 'sve' in name_lower:
        return 'SVE'
    else:
        return 'Baseline'

# 1. Run and Gather Data
for edir in exec_dirs:
    bench_name = edir.replace('_arm_executables', '').upper()
    os.chdir(edir)
    print(f"\n=========================================")
    print(f"Processing Directory: {edir}")
    print(f"=========================================")

    # Clear old results
    old_csvs = glob.glob('*.csv')
    for old_csv in old_csvs:
        os.remove(old_csv)

    executables = glob.glob('*.out')
    if executables:
        for exe in executables:
            print(f"  [>] Running {exe} 10 times...")
            for i in range(1, 11):
                try:
                    subprocess.run(['./' + exe], check=True)
                except Exception as e:
                    print(f"  [!] Error running {exe} on iteration {i}: {e}")
    else:
        print("  [!] No .out files found to run.")

    csv_files = glob.glob('*.csv')
    if not csv_files:
        print(f"  [!] No CSV found in {edir}. Skipping parsing.")
        os.chdir(base_dir)
        continue

    csv_file = csv_files[0]
    print(f"  [*] Reading data from {csv_file}...")

    with open(csv_file, 'r') as f:
        reader = csv.reader(f)
        for row in reader:
            if not row or len(row) < 3: 
                continue
            try:
                time_val = float(row[0])
                size_val = int(row[1])
                exe_name = row[2].strip().replace('./', '').replace('.out', '')
                config = get_config_type(exe_name)
                
                global_data[config][bench_name][size_val].append(time_val)
            except ValueError:
                continue
                
    os.chdir(base_dir)

print("\n=========================================")
print("Gathering Complete! Creating Grouped Bar Chart...")
print("=========================================")

# 2. Extract benchmarks and find their largest problem sizes
# Find all unique benchmarks we successfully collected data for
all_benchmarks = sorted(list(set(
    bench for config in global_data for bench in global_data[config]
)))

# For each benchmark, find the absolute largest problem size tested
largest_sizes = {}
for bench in all_benchmarks:
    all_sizes = []
    for config in ['Baseline', 'SVE', 'Polly']:
        if b_sizes := global_data[config][bench].keys():
            all_sizes.extend(b_sizes)
    largest_sizes[bench] = max(all_sizes) if all_sizes else None

# 3. Build arrays for the bars (extracting medians for the largest size)
baseline_times = []
sve_times = []
polly_times = []

for bench in all_benchmarks:
    max_size = largest_sizes[bench]
    
    # Baseline
    base_runs = global_data['Baseline'][bench][max_size]
    baseline_times.append(statistics.median(base_runs) if base_runs else 0.0)
    
    # SVE
    sve_runs = global_data['SVE'][bench][max_size]
    sve_times.append(statistics.median(sve_runs) if sve_runs else 0.0)
    
    # Polly
    polly_runs = global_data['Polly'][bench][max_size]
    polly_times.append(statistics.median(polly_runs) if polly_runs else 0.0)

# 4. Plotting the Grouped Bar Chart
x = np.arange(len(all_benchmarks))  # Label locations
width = 0.25  # Width of each individual bar

fig, ax = plt.subplots(figsize=(12, 7))

# Create the three sets of bars side-by-side
rects1 = ax.bar(x - width, baseline_times, width, label='Baseline', color='#7f7f7f') # Gray
rects2 = ax.bar(x, sve_times, width, label='SVE Vectorized', color='#1f77b4')       # Blue
rects3 = ax.bar(x + width, polly_times, width, label='Polly Optimized', color='#2ca02c') # Green

# Formatting
ax.set_ylabel('Median Execution Time (Seconds)', fontsize=12, fontweight='bold')
ax.set_title('Performance Comparison Across All Benchmarks\n(At Maximum Problem Size)', fontsize=14, fontweight='bold')
ax.set_xticks(x)

# Create clean labels showing the benchmark name AND the problem size N we picked
xtick_labels = [f"{bench}\n(N={largest_sizes[bench]})" for bench in all_benchmarks]
ax.set_xticklabels(xtick_labels, fontsize=10, fontweight='bold')

ax.legend(fontsize=11)
ax.grid(axis='y', linestyle='--', alpha=0.7)

# Add value labels on top of the bars dynamically (helps for small numbers)
def autolabel(rects):
    for rect in rects:
        height = rect.get_height()
        if height > 0:
            ax.annotate(f'{height:.3f}s',
                        xy=(rect.get_x() + rect.get_width() / 2, height),
                        xytext=(0, 3),  # 3 points vertical offset
                        textcoords="offset points",
                        ha='center', va='bottom', fontsize=8)

autolabel(rects1)
autolabel(rects2)
autolabel(rects3)

plt.tight_layout()

# Save final plot to root directory
output_png = 'All_Benchmarks_HeadToHead.png'
plt.savefig(output_png, dpi=300)
print(f"[+] Consolidated plot saved successfully as: {output_png}\n")