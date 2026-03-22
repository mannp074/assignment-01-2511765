// OP1: insertMany() — insert all 3 documents
db.products.insertMany([
  {
    product_id: "E101",
    name: "Smartphone",
    category: "Electronics",
    price: 30000,
    brand: "Samsung",
    specs: {
      ram: "8GB",
      storage: "128GB",
      battery: "5000mAh",
      warranty_years: 2
    },
    available: true
  },
  {
    product_id: "C201",
    name: "Men's T-Shirt",
    category: "Clothing",
    price: 799,
    brand: "Nike",
    sizes_available: ["S", "M", "L", "XL"],
    material: "Cotton",
    colors: ["Black", "White", "Blue"]
  },
  {
    product_id: "G301",
    name: "Organic Milk",
    category: "Groceries",
    price: 60,
    brand: "Amul",
    expiry_date: new Date("2024-12-31"),
    nutrition: {
      calories: 42,
      protein: "3.4g",
      fat: "1g"
    },
    in_stock: true
  }
]);


// OP2: find() — Electronics with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});


// OP3: find() — Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});


// OP4: updateOne() — add discount_percent
db.products.updateOne(
  { product_id: "E101" },
  { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — index on category
db.products.createIndex({ category: 1 });

// This index improves query performance when filtering by category,
// especially for large product collections where frequent searches
// are performed on category field.
