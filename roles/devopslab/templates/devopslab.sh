#!/bin/bash
_devopslab() {
  {{ devopslab_bin }}/docker-compose -f {{ devopslab_root }}/devopslab.yml $*
}

case "$1" in
  logs|restart|start|stop)
    _devopslab $1
    ;;
  rm)
    _devopslab stop
    _devopslab rm
    ;;
  up)
    _devopslab up -d
    ;;
  *)
    echo "Usage: $0 {logs|restart|rm|start|stop|up}"
esac

