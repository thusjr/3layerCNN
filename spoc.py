import numpy as np
import tensorflow as tf
import random
from tensorflow.python import pywrap_tensorflow
from matplotlib import pyplot as plt
import csv
import pandas as pd

train = []
test_x = []
test_y = []
result = []
acc = []


def get_dataset():
    with open("./dataset/train.csv") as csvfile:
        csvreader = csv.reader(csvfile)
        header = next(csvreader)
        alldata = []
        global train, test_x, test_y, result
        for row in csvreader:
            tt = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            tt[int(row[0])] = 1
            alldata.append((tt, np.array(row[1:]).astype(np.int) / 255))
            # print(alldata[-1])
            # plt.pause(1)

        train = alldata[0:len(alldata) - 2001]
        test = alldata[len(alldata) - 2000:]
        test_x = [ii[1] for ii in test]
        test_y = [ii[0] for ii in test]
        print('Import train set successfully')

        with open("./dataset/test.csv") as csvfile:
            csvreader = csv.reader(csvfile)
            header = next(csvreader)
            for row in csvreader:
                result.append(np.array(row[:]).astype(np.int) / 255)
        print('Import test set successfully')


def createCNN():
    global train, test_x, test_y, acc, result
    sess = tf.Session()
    in_units = 784

    x = tf.placeholder(tf.float32, [None, in_units])
    ly = tf.placeholder(tf.float32, [None, 10])
    x_images = tf.reshape(x, [-1, 28, 28, 1])

    conv1 = tf.layers.conv2d(
        inputs=x_images,
        filters=5,
        kernel_size=[5, 5],
        strides=1,
        padding='valid',
        activation=tf.nn.relu
    )
    pool1 = tf.layers.max_pooling2d(inputs=conv1, pool_size=[2, 2], strides=2)

    flat = tf.reshape(pool1, [-1, 12 * 12 * 5])
    logits = tf.layers.dense(inputs=flat, units=10)

    loss = tf.losses.softmax_cross_entropy(onehot_labels=ly, logits=logits)
    # train_op = tf.train.GradientDescentOptimizer(learning_rate=0.001).minimize(loss)
    train_op = tf.train.AdamOptimizer(0.001).minimize(loss)
    accuracy_op = tf.metrics.accuracy(labels=tf.argmax(ly, axis=1), predictions=tf.argmax(logits, axis=1))[1]
    init = tf.group(tf.global_variables_initializer(),
                    tf.local_variables_initializer())
    sess.run(init)

    for i in range(30000):
        chosed = random.sample(train, 100)
        batch_xs, batch_ys = [ii[1] for ii in chosed], [ii[0] for ii in chosed]
        train_loss, train_op_ = sess.run([loss, train_op], {x: batch_xs, ly: batch_ys})
        if i % 100 == 99:
            print('第', i + 1, '轮迭代后：')
            test_accuracy = sess.run(accuracy_op, {x: test_x, ly: test_y})
            acc.append(test_accuracy)
            print(train_loss)
            print(acc[-1])
    saver=tf.train.Saver()
    saver.save(sess,"Model/model.ckpt")
    # yy = []
    # for ii in range(280):
    #     rx = result[ii * 100:ii * 100 + 100]
    #     test_output = sess.run(logits, {x: rx, ly: test_y[:len(rx)]})
    #     inferenced_y = np.argmax(test_output, 1)
    #     yy.extend(inferenced_y.data)
    #
    # yy = [[ii] for ii in yy]
    # with open('result.csv', 'w', newline='') as f:
    #     writer = csv.writer(f)
    #     writer.writerows([['result']])
    #     writer.writerows(yy)
    sess.close()


def main():
    # get_dataset()
    # createCNN()
    # plt.plot(acc)
    # plt.show()
    saver=pywrap_tensorflow.NewCheckpointReader(r"./Model/model.ckpt")
    var_dict = saver.get_variable_to_shape_map()

    # for key in var_dict:
    #     print(key)

    datagroup=saver.get_tensor('dense/kernel')
    # for data1 in datagroup:
    #     # for data2 in data1:
    #     #     print(data2)
    #     print(data1)

    pd.DataFrame(datagroup).to_csv('data.csv')

    # 最后，循环打印输出
    # for key in var_dict:
    #     print("variable name: ", key)
    #     print(saver.get_tensor(key))

main()


# beta1_power
# beta2_power
# conv2d/kernel/Adam
# conv2d/bias/Adam_1
# conv2d/bias
# conv2d/kernel/Adam_1
# conv2d/kernel
# conv2d/bias/Adam
# dense/bias
# dense/bias/Adam
# dense/bias/Adam_1
# dense/kernel
# dense/kernel/Adam
# dense/kernel/Adam_1