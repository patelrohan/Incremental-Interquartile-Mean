# Part 1: Refactoring

In response to the provided code challenge, I took several steps to improve the code, making it more readable, maintainable, and comprehensible for future developers.

**1. Code Understanding:**
- To begin, I conducted research on the concept of Interquartile Mean (IQM) by referring to educational resources on YouTube and Google. This step was crucial for me to gain a clear understanding of IQM and how its calculation works.

**2. Standardizing Naming Conventions:**
- One of the initial improvements I made was standardizing the file and folder naming conventions to align with iOS naming conventions. This step not only adheres to industry standards but also enhances code readability.

**3. Code Refactoring:**
- I decided to move the logic from the `viewDidLoad` method to a separate function. `viewDidLoad` serves as a gateway to any class, and keeping it clean and concise is essential for understanding the code flow.
- I introduced a utility class called `FileReader` to encapsulate the file reading logic, ensuring that the `IIQM` class remains focused on its core functionality.
- Within the `calculateIncrementalIQM` function, I separated the code responsible for calculating incremental IQM for each value in the data set. This separation enhances unit testing possibilities and code maintainability.

**4. Comments and Documentation:**
- To improve code comprehensibility, I added comments within the `calculateIncrementalIQM` function to explain key logic where needed.
- At the top of the file, I included two valuable resources that I found during my research. These resources can aid future developers in understanding the logic behind IIQM calculations.

**5. Unit Testing:**
- I emphasized the importance of unit testing, particularly for the `calculateIncrementalIQM` function. Accurate calculation of IIQM is crucial, and comprehensive unit tests ensure the reliability of this function.

**6. Simplification:**
- Lastly, I simplified the equation for `upperQuartileIndex` to make it more concise and understandable.

Overall, these improvements aim to transform the code into something that is not only more readable but also adheres to best practices and serves as a valuable resource for developers aiming to understand IIQM calculations.

