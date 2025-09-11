//Extracts some array info(like size, sum, median, mode, sorted info)

//I'm quite liking scala, looks like Java but better(without that "verbosity")

import scala.util.Random

object ArrayInfo {

	val mArray = Array(5,8,1,3,3,7,4,2).toList

	def i2str(array: List[Int]): String = {

		array.mkString(",")

	}

	def main(args: Array[String]): Unit = {

		val sortedArray = mArray.sorted

		val len: Int = mArray.length

		println(s"Array: ${i2str(mArray)}\nLength: ${len}\nFirst Item: ${mArray(0)}\nLast Item: ${mArray(mArray.length-1)}")

		println(s"Sum: ${mArray.sum}\nProduct: ${mArray.product} (If the array is too big this can take a time to compute)\nMax: ${mArray.max}\nMin: ${mArray.min}")

		if (len % 2 == 0) {

			println(s"Median: (${sortedArray(len / 2 - 1)}, ${sortedArray(len / 2)})")

		} else {

			println(s"Median: ${sortedArray(len / 2)}")

		}

		println(s"Mode: ${mArray.groupBy(i => i).mapValues(_.size).maxBy(_._2)._1} (Warning! Can't handle Arrays without \"Mode Values\"!)")

		println(s"Array Reversed: ${i2str(mArray.reverse)}\nSorted: ${i2str(sortedArray)}\nReversed Sorted: ${i2str(sortedArray.reverse)}\nRandomized(shuffle): ${i2str(Random.shuffle(mArray))}")

		val toFind = 7

		println(s"Find ${toFind} in the index ${mArray.indexOf(toFind)}")

	}

}
