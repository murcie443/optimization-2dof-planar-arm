# optimization-2dof-planar-arm

This project is developed by a student enrolled in the Master's degree program in Automation Engineering at the Polytechnic University of Bari, as part of the Optimization and Control course.

The work extends the methodology presented by Chaudhary et al. in 'Design of Serial Link Manipulator with Uncertainties using Interval Method'. While the original study focuses on analyzing the achievement of a goal using grid search and interval methods , utilizing two pseudo-independent optimizations of physical parameters, this work introduces a multi-objective optimization framework paired with a dynamic control scheme and a Simscape-based physical model. By transitioning from a static design focus to a multi-cost approach, we provide a comprehensive analysis of the manipulator’s performance from a dynamic perspective. The proposed model evaluates the trade-offs between Dynamic Manipulability, the Local Conditioning Index (LCI), and target proximity, offering a more reliable and robust representation of real-world operating conditions.

## Control Scheme
<img src="https://github.com/murcie443/optimization-2dof-planar-arm/blob/main/Media/simul.png?raw=true" width="800">

## Optimization in progress...
<img src="https://github.com/murcie443/optimization-2dof-planar-arm/blob/main/Media/opt.gif?raw=true" width="800">

## Pareto Front Example
<img src="https://github.com/murcie443/optimization-2dof-planar-arm/blob/main/Results/Pareto%20Front%20with%20XZ%20contraint/gamultiobj/Pareto%20Front%203D.png?raw=true" width="800">

## Reference Paper
Saurabh Chaudhary, Virendra Kumar, and Soumen Sen. “Design of serial link manipulator
with uncertainties using interval method”. In: 2020 National Conference on Emerging Trends
on Sustainable Technology and Engineering Applications (NCETSTEA). 2020, pp. 1–6. doi:
10.1109/NCETSTEA48365.2020.9153880


## License
Copyright (c) 2026 Davide Tonti

Licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
