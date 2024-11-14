from launch import LaunchDescription
from launch.actions import ExecuteProcess
from launch.substitutions import PathJoinSubstitution
from launch_ros.substitutions import FindPackageShare

def generate_launch_description():
    urdf_path = PathJoinSubstitution([
        FindPackageShare('simulation'), 'robots', 'go2', 'go2.urdf'
    ])

    return LaunchDescription([
        ExecuteProcess(
            cmd=[
                'gz', 'service', '-s', '/world/shapes/create',
                '--reqtype', 'gz.msgs.EntityFactory',
                '--reptype', 'gz.msgs.Boolean',
                '--timeout', '1000',
                '--req', ['sdf_filename: "', urdf_path, '", name: "go2"']
            ],
            output='screen'
        )
    ])
