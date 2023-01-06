import tensorflow as tf
import numpy as np


# Pattern 
# vector []  
# matrix: [[],[],[]] 
# matrix stack: [ [[],[],[]],[[],[],[]],[[],[],[]] ]   

# 4
x = np.array([1,2,3,4], np.int32)

# 2*2
x = np.array([[1,2],[3,4]], np.int32)

# 2* 3*3
x = np.array([[[1,2,3],[2,3,4],[2,3,4]],[[7,5,6],[8,7,6],[7,5,6]]], np.int32)


# Tensorflow
# source operation: Constants, variables (take no input)
# tensor: input, output (multi-dimensional arrays)




sess = tf.Session()

# Constant
a = tf.constant([[1, 2], [3, 4]], dtype = tf.float32)
print(a)
print(sess.run(a))

# Placeholder
b = tf.placeholder(shape=[2], dtype=tf.float32)
my_input_array = np.array([1,1])
sess.run(b, feed_dict={b: my_input_array})


A = tf.placeholder(tf.float32, shape=(None, 3))
B = A + 5
with tf.Session() as sess:
	B_val_1 = B.eval(feed_dict={A: [[1, 2, 3]]})
	B_val_2 = B.eval(feed_dict={A: [[4, 5, 6], [7, 8, 9]]})



# Variable example1
c = tf.Variable([[1,2],[3,4]], dtype=tf.float32)
init = tf.global_variables_initializer()
sess.run(init)
sess.run(c)


# Variable example2

x1 = tf.Variable([[1,2], [3,4]], dtype= tf.float32)
x2 = tf.Variable([[5,6], [7,8]], dtype= tf.float32)

dot_ = tf.matmul(x1, x2) # np.dot
element_wise_multiply = tf.multiply(x1, x2) # element-wise mul
add_ = tf.add(x1, x2)

init = tf.global_variables_initializer()
sess.run(init)

res1, res2, res3 = sess.run([dot_, element_wise_multiply, add_])
print(res1)
print("---")
print(res2)
print("---")
print(res3)



# Graph -> Session

x = tf.Variable(3, name='x')
y = tf.Variable(4, name='y')
func = x*x*y + y + 2


with tf.Session() as sess:
	x.initializer.run()
	y.initializer.run()
	result = func.eval()

# Or init global

init = tf.global_variables_initializer()
with tf.Session() as sess:
	init.run()
	result = func.eval()



