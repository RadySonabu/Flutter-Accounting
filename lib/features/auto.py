import os

from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent

# subfolders = [f.path
#               for f in os.scandir(BASE_DIR) if f.is_dir()]
# print(subfolders)
# for item in subfolders:
#     print(type(item))

features = []
for f in os.scandir(BASE_DIR):
    if f.is_dir():
        features.append(f.path)
print(features)

my_input = input('what feature: ')
for item in features:
    print(os.path.basename(os.path.normpath(item)))
    for f in os.scandir(item):
        if f.is_dir():
            # if my_input == os.path.basename(os.path.normpath(f.path)):
            print(f.path)
            # if not os.path.exists(f'{f.path}/tmp/test'):
            #     with open(f'{f.path}/tmp/test', 'w'):
            #         pass
