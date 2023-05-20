import os
import glob
import sys
import shutil

if __name__ == "__main__":
    OS_TYPE = "linux"
    PROJECT_TYPE = "laravel"
    APP_NAME = "storemate-erp"
    APP_URL = "stm-iservice.com"

    if os.path.isdir("dist"):
        shutil.rmtree("dist")

    for file in [f.replace("\\", "/") for f in glob.glob("{}/{}/*".format(OS_TYPE, PROJECT_TYPE), recursive=True)]:
        new_path = "dist/" + "/".join(file.split("/")[:-1])
        new_file = new_path + "/" + file.split("/")[-1]

        if not os.path.isdir(new_path):
            os.makedirs(new_path)

        contentstr = open(file, "r").read()
        contentstr: str = contentstr.replace("#APP_NAME", APP_NAME)
        contentstr: str = contentstr.replace("#APP_URL", APP_URL)

        open(new_file, "w").write(contentstr)
