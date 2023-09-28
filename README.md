# Part 1: Refactoring

In response to the provided code challenge, I took several steps to improve the code, making it more readable, maintainable, and comprehensible for future developers.

**1. Code Understanding:**
- To begin, I conducted research on the concept of Interquartile Mean (IQM) by referring to educational resources on YouTube and Google. This step was crucial for me to gain a clear understanding of IQM and how its calculation works.

**2. Standardizing Naming Conventions:**
- One of the initial improvements I made was standardizing the file and folder naming conventions to align with iOS naming conventions. This step not only adheres to industry standards but also enhances code readability.

**3. Code Refactoring:**
- I decided to move the logic from the `viewDidLoad()` method to a separate function. `viewDidLoad()` serves as a gateway to any class, and keeping it clean and concise is essential for understanding the code flow.
- I introduced a utility class called `FileReader` to encapsulate the file reading logic, ensuring that the `IIQM` class remains focused on its core functionality. Similarly, created utility class `RPBinarySearch` to contain the logic of Binary Search. 
- Refactored `calculate` function, isolating the code/logic responsible for calculating incremental IQM for each value into its own `calculateIncrementalIQM()` function. This separation not only enhances unit testing but also promotes code modularity.

**4. Comments and Documentation:**
- To improve code comprehensibility, I added comments within the `calculateIncrementalIQM()` function to explain key logic where I felt would be valuable for future developers who might not be aware of IIQM calculation hoping expediated comprehension of the logic. 
- At the top of the file, I included two valuable resources that I found helpful during my research. These resources can aid future developers in understanding the logic behind IIQM calculations better and quicker.

**5. Unit Testing:**
- I emphasized the importance of unit testing, particularly for the `calculateIncrementalIQM()` function. Accurate calculation of IIQM is crucial, and comprehensive unit tests ensure the reliability of this function. Similarly, `RPBinarySearch` class's `search()` function is inlcuded in unit testing to ensure its reliability. 

**6. Simplification:**
- Lastly, I simplified the equation for `upperQuartileIndex` to make it more concise and understandable.

Overall, these improvements aim to transform the code into something that is not only more readable but also adheres to best practices and serves as a valuable resource for developers aiming to understand IIQM calculations.


# Part 2: Code Optimization

| Dataset Size (# of Elements)      | Old Approach (Time) | New Approach (Time) |
|-----------------------------------|---------------------|---------------------|
| 20,000                            | ~20.5 seconds       | ~4.8 seconds        |
| 100,000                           | ~549 seconds        | ~120 seconds        |


**1. Explain how your optimization works and why you took this approach ?**
- The provided code initially exhibited a time complexity of O(n^2 * log n) due to sorting the dataset after each element append. resulting in inefficiency. This is inefficient because we are inserting a new value to already sorted array and re-sorting it after inserting new value. 
To address this, I employed a more optimal strategy. By utilizing Binary Search, we can determine the precise insertion point for a new value, ensuring that the array remains sorted. This approach drastically reduces the time complexity to O(n * log n), as it eliminates the need to re-sort the entire dataset after each insertion.

**2. Would your approach continue to work if there were millions or billions of input values?**
- The scalability of this approach depends on several critical factors. It is anticipated to demonstrate efficient performance even when dealing with datasets comprising millions or billions of input values, provided that memory storage does not pose a constraint. However, the efficiency is also contingent upon the distribution of the data. If the data distribution necessitates shifting a significant proportion of elements in the array to the right after a majority of Binary Search insertions, this may adversely affect overall performance. Nevertheless, in the majority of scenarios, an algorithm with a time complexity of O(n * log n) should maintain its efficiency even when confronted with extensive datasets.

**3. Would your approach still be efficient if you needed to store the intermediate state between each IQM calculation in a data store?  If not, how would you change it to meet this requirement?**
- Core Data shall be able to handle hundreds of write operations per second. With careful design and optimization, achieving high write throughput is feasible. Batch processing, where IQM data is temporarily stored in an array before writing to Core Data, can alleviate performance bottlenecks, if there are any.  For extremely high write loads, additional scaling and architecture strategies might need to be considered like distributed databases.


