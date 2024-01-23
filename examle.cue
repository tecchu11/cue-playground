package root

import "github.com/tecchu11/cue-playground/ecs"

Example1: ecs.#ECSFargateTaskDefinition & {
	family:      "example-1"
	networkMode: "awsvpc"
	containerDefinitions: [
		{
			name:  "example-1-win"
			image: "example"
			portMappings: [
				{
					containerPort: 8080
					hostPort:      8080
				},
			]
		},
	]
	runtimePlatform: {
		cpuArchitecture:       "X86_64"
		operatingSystemFamily: "WINDOWS_SERVER_2022_FULL"
	}
	cpu:    "1024"
	memory: "2048"
}
