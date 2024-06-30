#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

struct Process {
    int pid;
    int arrival_time;
    int burst_time;
    int completion_time;
    int waiting_time;
    int turnaround_time;
};

// Function to calculate average waiting time and average turnaround time
void fifo_scheduling(vector<Process>& processes) {
    int n = processes.size();
    
    
    // Initialize the first process's completion time and calculate waiting and turnaround times
    int current_time = processes[0].arrival_time;
    for (int i = 0; i < n; ++i) {
        Process& process = processes[i];
        process.completion_time = current_time + process.burst_time;
        process.turnaround_time = process.completion_time - process.arrival_time;
        process.waiting_time = process.turnaround_time - process.burst_time;
        
        current_time = process.completion_time;
    }
    
    // Calculate average waiting time and average turnaround time
    double total_waiting_time = 0, total_turnaround_time = 0;
    for (const Process& process : processes) {
        total_waiting_time += process.waiting_time;
        total_turnaround_time += process.turnaround_time;
    }
    
    double average_waiting_time = total_waiting_time / n;
    double average_turnaround_time = total_turnaround_time / n;
    
    // Output results
    cout << "Average Waiting Time: " << average_waiting_time << endl;
    cout << "Average Turnaround Time: " << average_turnaround_time << endl;
}

int main() {
    vector<Process> processes = {
        {1, 0, 5, 0, 0, 0},
        {2, 1, 3, 0, 0, 0},
        {3, 2, 8, 0, 0, 0},
        {4, 3, 6, 0, 0, 0},
        {5, 4, 2, 0, 0, 0}
    }; //sample input
    
    fifo_scheduling(processes);
    
    return 0;
}
