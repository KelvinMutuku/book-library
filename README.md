# Book Library Application
This README provides instructions on **how to install Ruby on Rails 8, set up the project, run the application, and run tests**.  

---

## **📌 Project Overview**
This is a **Book Lending Library Application** built with **Ruby on Rails 8**. It allows registered users to:  
- 📖 **Browse available books**  
- 📥 **Borrow books** (with a 2-week due date)  
- 📤 **Return borrowed books**  
- 👤 **View their borrowed books in a user profile**  
- 🛠 **Admin panel** for managing books  
- 🔐 **User authentication using Devise (default Rails 8 authentication system)**  

---

## **🚀 Installation Guide**
### **1️⃣ Install Ruby and Rails 8**
#### **🔹 Install Ruby (If Not Installed)**
Ensure **Ruby 3.2+** is installed. To check:  
```sh
ruby -v
```
If Ruby is missing, install it via:  
- **Linux/macOS** (using RVM):  
  ```sh
  \curl -sSL https://get.rvm.io | bash -s stable --ruby
  rvm install ruby-3.2
  ```
- **Windows** (via RubyInstaller):  
  🔗 [Download Ruby for Windows](https://rubyinstaller.org/)  

#### **🔹 Install Rails 8**
Once Ruby is installed, install Rails 8:  
```sh
gem install rails -v 8.0.0
```
Verify installation:  
```sh
rails -v
```
It should return:  
```
Rails 8.0.0
```

---

### **2️⃣ Clone the Repository**
```sh
git clone <YOUR_GITHUB_REPO_URL>
cd book-library
```

---

### **3️⃣ Install Dependencies**
```sh
bundle install
```

---

### **4️⃣ Setup the Database**
Run migrations and seed data (if needed):  
```sh
rails db:create
rails db:migrate
rails db:seed  # Optional, if you have seed data
```

---

### **5️⃣ Install and Configure Authentication (Devise)**
This project uses **Rails 8's default authentication system (Devise)**.  
If Devise is not installed, run:  
```sh
bundle add devise
rails generate devise:install
```

Set up the **User model with Devise**:  
```sh
rails generate devise User
rails db:migrate
```

---

### **6️⃣ Start the Server**
```sh
rails server
```
Now, open your browser and visit:  
🔗 **http://localhost:3000**  

---

## **🛠 Running Tests**
Run the Rails test suite to ensure everything works correctly:  
```sh
rails test
```

---

## **👨‍💻 Admin Access**
To access the **Admin Dashboard**, create an admin user manually:  
1️⃣ Open Rails Console:  
```sh
rails console
```
2️⃣ Create an admin:  
```ruby
User.create!(email: "admin@example.com", password: "password", admin: true)
```
3️⃣ **Log in** with `admin@example.com` and password `password`.  

---

## **🌐 GitHub Repository**
🔗 **GitHub URL:** [**https://github.com/KelvinMutuku/book-library**]  
