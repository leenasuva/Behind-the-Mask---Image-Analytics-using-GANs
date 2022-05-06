FILE=$1

TARGET_DIR=./checkpoints/${FILE}_pretrained/



mkdir -p $TARGET_DIR
tar -zxvf $TAR_FILE -C ./checkpoints/
