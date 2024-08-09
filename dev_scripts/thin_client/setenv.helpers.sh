#
# Configure the local (thin) client built with `thin_client.../build.py`.
#
# NOTE: This file needs to be sourced and not executed. For this reason doesn't
# use bash and doesn't have +x permissions.
# 

# NOTE: We can't use $0 to find out in which file we are in, since this file is
# sourced and not executed.
SCRIPT_PATH="dev_scripts/thin_client/setenv.helpers.sh"
echo "##> $SCRIPT_PATH"

DIR_PREFIX="helpers"

VENV_PREFIX="helpers"

# Give permissions to read / write to user and group.
umask 002

# Source `utils.sh`.
# NOTE: we can't use $0 to find the path since we are sourcing this file.
GIT_ROOT_PATH=$(pwd)
SOURCE_PATH=$GIT_ROOT_PATH/dev_scripts/thin_client/utils.sh
echo "> source $SOURCE_PATH ..."
source $SOURCE_PATH

# Set the derived vars common to all the scripts.
GIT_ROOT_DIR=$(pwd)
echo "GIT_ROOT_DIR=$GIT_ROOT_DIR"
dassert_is_git_root

# #############################################################################
# PATH
# #############################################################################

DEV_SCRIPT_DIR="${GIT_ROOT_DIR}/dev_scripts"
echo "DEV_SCRIPT_DIR=$DEV_SCRIPT_DIR"
dassert_dir_exists $DEV_SCRIPT_DIR

set_path $DEV_SCRIPT_DIR

# #############################################################################
# PYTHONPATH
# #############################################################################

set_pythonpath

configure_specific_project

print_env_signature

echo -e "${INFO}: ${SCRIPT_PATH} successful"
