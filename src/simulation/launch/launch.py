from launch import LaunchDescription
from launch.actions import SetEnvironmentVariable, ExecuteProcess

def generate_launch_description():
    return LaunchDescription([
        SetEnvironmentVariable(
            name='GZ_SIM_RESOURCE_PATH',
            value='/workspace/src'
        ),

        ExecuteProcess(
            cmd=['gz', 'sim', 'shapes.sdf'],
            output='screen'
        )
    ])
