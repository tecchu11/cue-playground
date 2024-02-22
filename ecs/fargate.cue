package ecs

import (
	"strconv"
	"strings"
)

#ECSFargateTaskDefinition: #ECSTaskDefinition & {
	networkMode: "awsvpc"
	containerDefinitions: [...{
		portMappings?: [...{
			containerPort?: int
			hostPort?:      "_|_" | containerPort
		}]
		logConfiguration?: {
			if strings.HasPrefix(runtimePlatform.operatingSystemFamily, "WINDOWS") {
				logDriver: "awslogs" | "splunk"
			}
			logDriver: "awslogs" | "splunk" | "awsfirelens"
		}
		linuxParameters?: {
			capabilities?: {
				add?: "_|_"
			}
			devices?: "_|_"
		}
		disableNetworking?:     "_|_"
		dnsServers?:            "_|_"
		dnsSearchDomains?:      "_|_"
		extraHosts?:            "_|_"
		dockerSecurityOptions?: "_|_"
	}]
	cpu:  string
	_cpu: strconv.Atoi(cpu)
	if strings.HasPrefix(runtimePlatform.operatingSystemFamily, "WINDOWS") {
		_cpu: int & >=1024
	}
	memory: string
	requiresCompatibilities: ["FARGATE"]
	runtimePlatform?: {
		cpuArchitecture:       string
		operatingSystemFamily: string
	}
}
