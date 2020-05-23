# Enable use of windows paths.
# https://docs.docker.com/compose/reference/envvars/#/composeconvertwindowspaths
export COMPOSE_CONVERT_WINDOWS_PATHS=true;

docker-compose -f docker-compose.yml up
