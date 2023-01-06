import tensorflow as tf
import numpy as np
from sklearn.datasets import fetch_california_housing


# Data Generate
housing = fetch_california_housing()
m, n = housing.data.shape
housing_data_plus_bias = np.c_[np.ones((m, 1)), housing.data]



# Construction phase

X = tf.constant(housing_data_plus_bias, dtype=tf.float32, name="X")
y = tf.constant(housing.target.reshape(-1, 1), dtype=tf.float32, name="y")  # reshape: only one column, but unknown row (until the end)
XT = tf.transpose(X)
theta = tf.matmul(tf.matmul(tf.matrix_inverse(tf.matmul(XT, X)), XT), y) # matmul: np.dot



# Execution phase
with tf.Session() as sess:
    theta_value = theta.eval()




# By Gradient Descent

# method1
def meanNormal(X):
    X = (X - np.mean(X)) / (np.max(X) - np.min(X))
    return X

scaled_housing_data_plus_bias = meanNormal(housing_data_plus_bias)

# method2
from sklearn.preprocessing import StandardScaler
scaler = StandardScaler()
scaled_housing_data_plus_bias = scaler.fit_transform(housing_data_plus_bias)


# Construction phase
n_epochs = 1000
learning_rate = 0.01
X = tf.constant(scaled_housing_data_plus_bias, dtype=tf.float32, name="X")
y = tf.constant(housing.target.reshape(-1, 1), dtype=tf.float32, name="y")
theta = tf.Variable(tf.random_uniform([n + 1, 1], -1.0, 1.0), name="theta") #shape, min, max
y_pred = tf.matmul(X, theta, name="predictions")
error = y_pred - y
mse = tf.reduce_mean(tf.square(error), name="mse")
gradients = 2/m * tf.matmul(tf.transpose(X), error)

# assign update value from Gradient Descent
training_op = tf.assign(theta, theta - learning_rate * gradients)
init = tf.global_variables_initializer()


# Execution phase
with tf.Session() as sess:
    sess.run(init)
    for epoch in range(n_epochs):
        if epoch%100==0:
            print("Epoch", epoch, "MSE =", mse.eval())
            sess.run(training_op)
    best_theta = theta.eval()


# Using an Optimizer
optimizer = tf.train.GradientDescentOptimizer(learning_rate=learning_rate)
training_op = optimizer.minimize(mse)

init = tf.global_variables_initializer()
with tf.Session() as sess:
    sess.run(init)
    for epoch in range(n_epochs):
        if epoch%100==0:
            print("Epoch", epoch, "MSE =", mse.eval())
            sess.run(training_op)
    best_theta = theta.eval()




# Mini-batch
X = tf.placeholder(tf.float32, shape=(None, n + 1), name="X")
y = tf.placeholder(tf.float32, shape=(None, 1), name="y")

batch_size = 100
n_batches = int(np.ceil(m / batch_size))


def fetch_batch(epoch, batch_index, batch_size):
	'''
	load data
	'''
	return X_batch, y_batch


with tf.Session() as sess:
	sess.run(init)
	for epoch in range(n_epochs):
		for batch_index in range(n_batches):
			X_batch, y_batch = fetch_batch(epoch, batch_index, batch_size)
			sess.run(training_op, feed_dict={X: X_batch, y: y_batch})
	best_theta = theta.eval()




# Save model
init = tf.global_variables_initializer()
saver = tf.train.Saver()
# name the variables
saver = tf.train.Saver({'weights': theta})

with tf.Session() as sess:
	sess.run(init)

	for epoch in range(n_epochs):
		if epoch % 100 == 0:
			save_path = saver.save(sess, 'tmp/my_model.ckpt')

			sess.run(training_op)
	best_theta = theta.eval()
	save_path = saver.save(sess, 'tmp/my_final.ckpt')
# or

with tf.Session() as sess:
	saver.restore(sess, 'tmp/my_final.ckpt')
















