---
title: Working with objects
slug: Web/JavaScript/Guide/Working_with_objects
page-type: guide
sidebar: jssidebar
---

{{PreviousNext("Web/JavaScript/Guide/Keyed_collections", "Web/JavaScript/Guide/Using_classes")}}

JavaScript được thiết kế trên mô hình lập trình dựa trên đối tượng. Đối tượng là tập hợp các [thuộc tính](/en-US/docs/Glossary/Property/JavaScript), và thuộc tính là sự liên kết giữa tên (hay _khóa_) và giá trị. Giá trị của thuộc tính có thể là hàm, trong trường hợp đó thuộc tính được gọi là [phương thức](/en-US/docs/Glossary/Method).

Đối tượng trong JavaScript, cũng như trong nhiều ngôn ngữ lập trình khác, có thể so sánh với đối tượng trong thực tế. Trong JavaScript, đối tượng là thực thể độc lập có thuộc tính và kiểu. Hãy so sánh với cái cốc chẳng hạn. Cái cốc là đối tượng có thuộc tính. Cốc có màu sắc, thiết kế, trọng lượng, chất liệu, v.v. Tương tự, đối tượng JavaScript cũng có thể có các thuộc tính xác định đặc điểm của chúng.

Ngoài các đối tượng được định nghĩa sẵn trong trình duyệt, bạn có thể định nghĩa các đối tượng của riêng mình. Chương này mô tả cách sử dụng đối tượng, thuộc tính và phương thức, cũng như cách tạo đối tượng của riêng bạn.

## Tạo đối tượng mới

Bạn có thể tạo đối tượng bằng [object initializer](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer). Hoặc, bạn có thể tạo hàm tạo (constructor function) trước rồi khởi tạo đối tượng bằng cách gọi hàm đó với toán tử `new`.

### Dùng object initializers

Object initializer còn được gọi là _object literals_. "Object initializer" nhất quán với thuật ngữ dùng trong C++.

Cú pháp cho đối tượng dùng object initializer là:

```js
const obj = {
  property1: value1, // property name may be an identifier
  2: value2, // or a number
  "property n": value3, // or a string
};
```

Mỗi tên thuộc tính trước dấu hai chấm là identifier, số literal, hoặc string literal, và mỗi `valueN` là biểu thức có giá trị được gán cho tên thuộc tính. Tên thuộc tính cũng có thể là biểu thức; các khóa được tính toán cần được đặt trong dấu ngoặc vuông. Tham chiếu [object initializer](/en-US/docs/Web/JavaScript/Reference/Operators/Object_initializer) chứa giải thích chi tiết hơn về cú pháp.

Trong ví dụ này, đối tượng mới được tạo được gán cho biến `obj` — điều này là tùy chọn. Nếu bạn không cần tham chiếu đối tượng này ở nơi khác, bạn không cần gán nó cho biến. (Lưu ý rằng bạn có thể cần bọc object literal trong ngoặc đơn nếu đối tượng xuất hiện ở nơi một câu lệnh được mong đợi, để tránh nhầm lẫn literal với block statement.)

Object initializer là các biểu thức, và mỗi object initializer tạo ra một đối tượng mới mỗi khi câu lệnh chứa nó được thực thi. Các object initializer giống hệt nhau tạo ra các đối tượng riêng biệt không bằng nhau khi so sánh.

Câu lệnh sau tạo đối tượng và gán cho biến `x` nếu và chỉ nếu biểu thức `cond` là true:

```js
let x;
if (cond) {
  x = { greeting: "hi there" };
}
```

Ví dụ sau tạo `myHonda` với ba thuộc tính. Lưu ý rằng thuộc tính `engine` cũng là đối tượng với các thuộc tính của riêng nó.

```js
const myHonda = {
  color: "red",
  wheels: 4,
  engine: { cylinders: 4, size: 2.2 },
};
```

Các đối tượng tạo bằng initializer được gọi là _plain objects_, vì chúng là instance của {{jsxref("Object")}}, nhưng không phải của kiểu đối tượng nào khác. Một số kiểu đối tượng có cú pháp initializer đặc biệt — ví dụ như [array initializers](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#array_literals) và [regex literals](/en-US/docs/Web/JavaScript/Guide/Regular_expressions#creating_a_regular_expression).

### Dùng hàm tạo (constructor function)

Ngoài ra, bạn có thể tạo đối tượng theo hai bước:

1. Định nghĩa kiểu đối tượng bằng cách viết hàm tạo. Theo quy ước mạnh mẽ có lý do chính đáng, nên dùng chữ cái đầu viết hoa.
2. Tạo instance của đối tượng với [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new).

Để định nghĩa kiểu đối tượng, hãy tạo hàm cho kiểu đối tượng chỉ định tên, thuộc tính và phương thức. Ví dụ, giả sử bạn muốn tạo kiểu đối tượng cho xe ô tô. Bạn muốn kiểu đối tượng này được gọi là `Car` và có các thuộc tính make, model và year. Để làm điều này, bạn sẽ viết hàm sau:

```js
function Car(make, model, year) {
  this.make = make;
  this.model = model;
  this.year = year;
}
```

Lưu ý cách dùng `this` để gán giá trị cho thuộc tính của đối tượng dựa trên các giá trị được truyền vào hàm.

Bây giờ bạn có thể tạo đối tượng `myCar` như sau:

```js
const myCar = new Car("Eagle", "Talon TSi", 1993);
```

Câu lệnh này tạo `myCar` và gán các giá trị đã chỉ định cho các thuộc tính của nó. Khi đó giá trị `myCar.make` là chuỗi `"Eagle"`, `myCar.model` là chuỗi `"Talon TSi"`, `myCar.year` là số nguyên `1993`, và v.v. Thứ tự các đối số và tham số phải giống nhau.

Bạn có thể tạo bất kỳ số lượng đối tượng `Car` nào bằng cách gọi `new`. Ví dụ:

```js
const randCar = new Car("Nissan", "300ZX", 1992);
const kenCar = new Car("Mazda", "Miata", 1990);
```

Một đối tượng có thể có thuộc tính bản thân là đối tượng khác. Ví dụ, giả sử bạn định nghĩa đối tượng `Person` như sau:

```js
function Person(name, age, sex) {
  this.name = name;
  this.age = age;
  this.sex = sex;
}
```

và sau đó khởi tạo hai đối tượng `Person` mới như sau:

```js
const rand = new Person("Rand McKinnon", 33, "M");
const ken = new Person("Ken Jones", 39, "M");
```

Sau đó, bạn có thể viết lại định nghĩa `Car` để bao gồm thuộc tính `owner` nhận đối tượng `Person` như sau:

```js
function Car(make, model, year, owner) {
  this.make = make;
  this.model = model;
  this.year = year;
  this.owner = owner;
}
```

Để khởi tạo các đối tượng mới, bạn dùng:

```js
const car1 = new Car("Eagle", "Talon TSi", 1993, rand);
const car2 = new Car("Nissan", "300ZX", 1992, ken);
```

Lưu ý rằng thay vì truyền chuỗi literal hay giá trị số nguyên khi tạo đối tượng mới, các câu lệnh trên truyền đối tượng `rand` và `ken` làm đối số cho owner. Khi đó nếu bạn muốn tìm tên chủ sở hữu của `car2`, bạn có thể truy cập thuộc tính sau:

```js
car2.owner.name;
```

Bạn luôn có thể thêm thuộc tính vào đối tượng đã được định nghĩa trước. Ví dụ, câu lệnh

```js
car1.color = "black";
```

thêm thuộc tính `color` vào `car1` và gán cho nó giá trị `"black"`. Tuy nhiên, điều này không ảnh hưởng đến bất kỳ đối tượng nào khác. Để thêm thuộc tính mới cho tất cả đối tượng cùng kiểu, bạn phải thêm thuộc tính vào định nghĩa kiểu đối tượng `Car`.

Bạn cũng có thể dùng cú pháp [`class`](/en-US/docs/Web/JavaScript/Reference/Classes) thay vì cú pháp `function` để định nghĩa hàm tạo. Để biết thêm thông tin, xem [hướng dẫn class](/en-US/docs/Web/JavaScript/Guide/Using_classes).

### Dùng phương thức Object.create()

Đối tượng cũng có thể được tạo bằng phương thức {{jsxref("Object.create()")}}. Phương thức này rất hữu ích vì cho phép bạn chọn đối tượng [prototype](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain) cho đối tượng bạn muốn tạo, mà không cần định nghĩa hàm tạo.

```js
// Animal properties and method encapsulation
const animalProto = {
  type: "Invertebrates", // Default value of properties
  displayType() {
    // Method which will display the type of animal
    console.log(this.type);
  },
};

// Create a new animal type called `animal`
const animal = Object.create(animalProto);
animal.displayType(); // Logs: Invertebrates

// Create a new animal type called fish
const fish = Object.create(animalProto);
fish.type = "Fishes";
fish.displayType(); // Logs: Fishes
```

## Đối tượng và thuộc tính

Đối tượng JavaScript có các thuộc tính liên quan. Thuộc tính đối tượng về cơ bản giống biến, ngoại trừ chúng liên kết với đối tượng, không phải [scope](/en-US/docs/Glossary/Scope). Các thuộc tính của đối tượng xác định đặc điểm của đối tượng.

Ví dụ, đây là ví dụ tạo đối tượng `myCar` với các thuộc tính `make`, `model` và `year`, với giá trị được đặt là `"Ford"`, `"Mustang"` và `1969`:

```js
const myCar = {
  make: "Ford",
  model: "Mustang",
  year: 1969,
};
```

Như biến JavaScript, tên thuộc tính phân biệt chữ hoa chữ thường. Tên thuộc tính chỉ có thể là chuỗi hoặc Symbol — tất cả khóa đều [chuyển đổi thành chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion) trừ khi chúng là Symbol. [Chỉ số mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#array_indices) thực ra là thuộc tính với khóa chuỗi chứa số nguyên.

### Truy cập thuộc tính

Bạn có thể truy cập thuộc tính của đối tượng theo tên thuộc tính. [Property accessors](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors) có hai cú pháp: _dot notation_ và _bracket notation_. Ví dụ, bạn có thể truy cập các thuộc tính của đối tượng `myCar` như sau:

```js
// Dot notation
myCar.make = "Ford";
myCar.model = "Mustang";
myCar.year = 1969;

// Bracket notation
myCar["make"] = "Ford";
myCar["model"] = "Mustang";
myCar["year"] = 1969;
```

Tên thuộc tính đối tượng có thể là bất kỳ chuỗi JavaScript hoặc [symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol) nào, kể cả chuỗi rỗng. Tuy nhiên, bạn không thể dùng dot notation để truy cập thuộc tính có tên không phải là identifier JavaScript hợp lệ. Ví dụ, tên thuộc tính có dấu cách hay dấu gạch nối, bắt đầu bằng chữ số, hoặc được lưu trong biến chỉ có thể truy cập bằng bracket notation. Cú pháp này cũng rất hữu ích khi tên thuộc tính được xác định động, tức là không thể xác định đến runtime. Ví dụ như sau:

```js
const myObj = {};
const str = "myString";
const rand = Math.random();
const anotherObj = {};

// Create additional properties on myObj
myObj.type = "Dot syntax for a key named type";
myObj["date created"] = "This key has a space";
myObj[str] = "This key is in variable str";
myObj[rand] = "A random number is the key here";
myObj[anotherObj] = "This key is object anotherObj";
myObj[""] = "This key is an empty string";

console.log(myObj);
// {
//   type: 'Dot syntax for a key named type',
//   'date created': 'This key has a space',
//   myString: 'This key is in variable str',
//   '0.6398914448618778': 'A random number is the key here',
//   '[object Object]': 'This key is object anotherObj',
//   '': 'This key is an empty string'
// }
console.log(myObj.myString); // 'This key is in variable str'
```

Trong đoạn code trên, khóa `anotherObj` là đối tượng, không phải chuỗi hay symbol. Khi nó được thêm vào `myObj`, JavaScript gọi phương thức {{jsxref("Object/toString", "toString()")}} của `anotherObj` và dùng chuỗi kết quả làm khóa mới.

Bạn cũng có thể truy cập thuộc tính bằng giá trị chuỗi được lưu trong biến. Biến phải được truyền trong bracket notation. Trong ví dụ trên, biến `str` giữ `"myString"` và đó là `"myString"` là tên thuộc tính. Vì vậy, `myObj.str` sẽ trả về undefined.

```js
str = "myString";
myObj[str] = "This key is in variable str";

console.log(myObj.str); // undefined

console.log(myObj[str]); // 'This key is in variable str'
console.log(myObj.myString); // 'This key is in variable str'
```

Điều này cho phép truy cập bất kỳ thuộc tính nào được xác định tại runtime:

```js
let propertyName = "make";
myCar[propertyName] = "Ford";

// access different properties by changing the contents of the variable
propertyName = "model";
myCar[propertyName] = "Mustang";

console.log(myCar); // { make: 'Ford', model: 'Mustang' }
```

Tuy nhiên, hãy cẩn thận khi dùng dấu ngoặc vuông để truy cập thuộc tính có tên do đầu vào bên ngoài cung cấp. Điều này có thể khiến code của bạn dễ bị [tấn công object injection](https://github.com/eslint-community/eslint-plugin-security/blob/main/docs/the-dangers-of-square-bracket-notation.md).

Các thuộc tính không tồn tại của đối tượng có giá trị {{jsxref("undefined")}} (không phải [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null)).

```js
myCar.nonexistentProperty; // undefined
```

### Liệt kê thuộc tính

Có ba cách gốc để liệt kê/duyệt qua các thuộc tính đối tượng:

- Vòng lặp [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in). Phương pháp này duyệt qua tất cả thuộc tính chuỗi enumerable của đối tượng cũng như chuỗi prototype của nó.
- {{jsxref("Object.keys()")}}. Phương thức này trả về mảng chỉ chứa tên thuộc tính chuỗi enumerable own ("keys") trong đối tượng `myObj`, không bao gồm những thuộc tính trong chuỗi prototype.
- {{jsxref("Object.getOwnPropertyNames()")}}. Phương thức này trả về mảng chứa tất cả tên thuộc tính chuỗi own trong đối tượng `myObj`, bất kể chúng có enumerable hay không.

Bạn có thể dùng bracket notation với [`for...in`](/en-US/docs/Web/JavaScript/Reference/Statements/for...in) để duyệt qua tất cả các thuộc tính enumerable của đối tượng. Để minh họa cách hoạt động, hàm sau hiển thị các thuộc tính của đối tượng khi bạn truyền đối tượng và tên đối tượng làm đối số cho hàm:

```js
function showProps(obj, objName) {
  let result = "";
  for (const i in obj) {
    // Object.hasOwn() is used to exclude properties from the object's
    // prototype chain and only show "own properties"
    if (Object.hasOwn(obj, i)) {
      result += `${objName}.${i} = ${obj[i]}\n`;
    }
  }
  console.log(result);
}
```

Thuật ngữ "own property" (thuộc tính own) đề cập đến các thuộc tính của đối tượng, nhưng loại trừ những thuộc tính trong chuỗi prototype. Vì vậy, lời gọi hàm `showProps(myCar, 'myCar')` sẽ in ra:

```plain
myCar.make = Ford
myCar.model = Mustang
myCar.year = 1969
```

Điều trên tương đương với:

```js
function showProps(obj, objName) {
  let result = "";
  Object.keys(obj).forEach((i) => {
    result += `${objName}.${i} = ${obj[i]}\n`;
  });
  console.log(result);
}
```

Không có cách gốc nào để liệt kê tất cả các thuộc tính được kế thừa, kể cả những thuộc tính không enumerable. Tuy nhiên, điều này có thể đạt được với hàm sau:

```js
function listAllProperties(myObj) {
  let objectToInspect = myObj;
  let result = [];

  while (objectToInspect !== null) {
    result = result.concat(Object.getOwnPropertyNames(objectToInspect));
    objectToInspect = Object.getPrototypeOf(objectToInspect);
  }

  return result;
}
```

Để biết thêm thông tin, xem [Enumerability and ownership of properties](/en-US/docs/Web/JavaScript/Guide/Enumerability_and_ownership_of_properties).

### Xóa thuộc tính

Bạn có thể xóa thuộc tính non-inherited bằng toán tử [`delete`](/en-US/docs/Web/JavaScript/Reference/Operators/delete). Đoạn code sau cho thấy cách xóa thuộc tính.

```js
// Creates a new object, myObj, with two properties, a and b.
const myObj = { a: 5, b: 12 };

// Removes the a property, leaving myObj with only the b property.
delete myObj.a;
console.log("a" in myObj); // false
```

## Kế thừa

Tất cả các đối tượng trong JavaScript kế thừa từ ít nhất một đối tượng khác. Đối tượng được kế thừa từ đó được gọi là prototype, và các thuộc tính được kế thừa có thể tìm thấy trong đối tượng `prototype` của hàm tạo. Xem [Inheritance and the prototype chain](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain) để biết thêm thông tin.

### Định nghĩa thuộc tính cho tất cả đối tượng của một kiểu

Bạn có thể thêm thuộc tính cho tất cả đối tượng được tạo thông qua một [hàm tạo](#dùng_hàm_tạo_constructor_function) nhất định bằng cách dùng thuộc tính [`prototype`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/prototype). Điều này định nghĩa thuộc tính được chia sẻ bởi tất cả đối tượng của kiểu đó, thay vì chỉ một instance. Đoạn code sau thêm thuộc tính `color` cho tất cả đối tượng kiểu `Car`, rồi đọc giá trị thuộc tính từ instance `car1`.

```js
Car.prototype.color = "red";
console.log(car1.color); // "red"
```

## Định nghĩa phương thức

_Phương thức_ là hàm liên kết với đối tượng, hay nói cách khác, phương thức là thuộc tính của đối tượng là hàm. Phương thức được định nghĩa theo cách hàm bình thường được định nghĩa, ngoại trừ chúng phải được gán làm thuộc tính của đối tượng. Xem thêm [method definitions](/en-US/docs/Web/JavaScript/Reference/Functions/Method_definitions) để biết thêm chi tiết. Ví dụ:

```js
objectName.methodName = functionName;

const myObj = {
  myMethod: function (params) {
    // do something
  },

  // this works too!
  myOtherMethod(params) {
    // do something else
  },
};
```

trong đó `objectName` là đối tượng hiện có, `methodName` là tên bạn gán cho phương thức, và `functionName` là tên hàm.

Sau đó bạn có thể gọi phương thức trong ngữ cảnh của đối tượng như sau:

```js
objectName.methodName(params);
```

Phương thức thường được định nghĩa trên đối tượng `prototype` của hàm tạo, để tất cả đối tượng cùng kiểu chia sẻ cùng phương thức. Ví dụ, bạn có thể định nghĩa hàm định dạng và hiển thị các thuộc tính của đối tượng `Car` đã định nghĩa trước.

```js
Car.prototype.displayCar = function () {
  const result = `A Beautiful ${this.year} ${this.make} ${this.model}`;
  console.log(result);
};
```

Lưu ý cách dùng `this` để tham chiếu đến đối tượng mà phương thức thuộc về. Sau đó bạn có thể gọi phương thức `displayCar` cho mỗi đối tượng như sau:

```js
car1.displayCar();
car2.displayCar();
```

### Dùng this để tham chiếu đối tượng

JavaScript có từ khóa đặc biệt [`this`](/en-US/docs/Web/JavaScript/Reference/Operators/this), mà bạn có thể dùng trong phương thức để tham chiếu đến đối tượng hiện tại. Ví dụ, giả sử bạn có 2 đối tượng `manager` và `intern`. Mỗi đối tượng có `name`, `age` và `job` riêng. Trong hàm `sayHi()`, lưu ý cách dùng `this.name`. Khi được thêm vào 2 đối tượng, cùng một hàm sẽ in ra thông báo với tên của đối tượng tương ứng mà nó gắn vào.

```js
const manager = {
  name: "Karina",
  age: 27,
  job: "Software Engineer",
};
const intern = {
  name: "Tyrone",
  age: 21,
  job: "Software Engineer Intern",
};

function sayHi() {
  console.log(`Hello, my name is ${this.name}`);
}

// Add sayHi function to both objects
manager.sayHi = sayHi;
intern.sayHi = sayHi;

manager.sayHi(); // Hello, my name is Karina
intern.sayHi(); // Hello, my name is Tyrone
```

`this` là "tham số ẩn" của lời gọi hàm được truyền vào bằng cách chỉ định đối tượng trước hàm được gọi. Ví dụ, trong `manager.sayHi()`, `this` là đối tượng `manager` vì `manager` đứng trước hàm `sayHi()`. Nếu bạn truy cập cùng một hàm từ đối tượng khác, `this` cũng thay đổi theo. Nếu bạn dùng các phương thức khác để gọi hàm, như {{jsxref("Function.prototype.call()")}} hoặc {{jsxref("Reflect.apply()")}}, bạn có thể truyền tường minh giá trị của `this` làm đối số.

## Định nghĩa getter và setter

[Getter](/en-US/docs/Web/JavaScript/Reference/Functions/get) là hàm liên kết với thuộc tính để lấy giá trị của thuộc tính cụ thể. [Setter](/en-US/docs/Web/JavaScript/Reference/Functions/set) là hàm liên kết với thuộc tính để đặt giá trị của thuộc tính cụ thể. Cùng nhau, chúng có thể biểu diễn gián tiếp giá trị của thuộc tính.

Getter và setter có thể:

- được định nghĩa trong [object initializers](#dùng_object_initializers), hoặc
- được thêm sau vào bất kỳ đối tượng hiện có nào.

Trong [object initializers](#dùng_object_initializers), getter và setter được định nghĩa như các [phương thức](/en-US/docs/Web/JavaScript/Reference/Functions/Method_definitions) thông thường, nhưng có tiền tố là từ khóa `get` hoặc `set`. Getter method không được mong đợi tham số nào, trong khi setter method nhận đúng một tham số (giá trị mới cần đặt). Ví dụ:

```js
const myObj = {
  a: 7,
  get b() {
    return this.a + 1;
  },
  set c(x) {
    this.a = x / 2;
  },
};

console.log(myObj.a); // 7
console.log(myObj.b); // 8, returned from the get b() method
myObj.c = 50; // Calls the set c(x) method
console.log(myObj.a); // 25
```

Các thuộc tính của đối tượng `myObj` là:

- `myObj.a` — một số
- `myObj.b` — getter trả về `myObj.a` cộng 1
- `myObj.c` — setter đặt giá trị `myObj.a` bằng một nửa giá trị mà `myObj.c` được đặt

Getter và setter cũng có thể được thêm vào đối tượng bất cứ lúc nào sau khi tạo bằng phương thức {{jsxref("Object.defineProperties()")}}. Tham số đầu tiên của phương thức này là đối tượng bạn muốn định nghĩa getter hay setter. Tham số thứ hai là đối tượng có tên thuộc tính là tên getter hoặc setter, và giá trị thuộc tính là đối tượng định nghĩa hàm getter hoặc setter. Đây là ví dụ định nghĩa getter và setter giống như ví dụ trước:

```js
const myObj = { a: 0 };

Object.defineProperties(myObj, {
  b: {
    get() {
      return this.a + 1;
    },
  },
  c: {
    set(x) {
      this.a = x / 2;
    },
  },
});

myObj.c = 10; // Runs the setter, which assigns 10 / 2 (5) to the 'a' property
console.log(myObj.b); // Runs the getter, which yields a + 1 or 6
```

Việc lựa chọn hai hình thức nào phụ thuộc vào phong cách lập trình và nhiệm vụ cần thực hiện. Nếu bạn có thể thay đổi định nghĩa đối tượng gốc, bạn có thể định nghĩa getter và setter thông qua initializer gốc. Hình thức này nhỏ gọn và tự nhiên hơn. Tuy nhiên, nếu bạn cần thêm getter và setter sau — có lẽ vì bạn không viết đối tượng cụ thể đó — thì hình thức thứ hai là cách duy nhất có thể. Hình thức thứ hai biểu diễn tốt hơn bản chất động của JavaScript, nhưng có thể làm code khó đọc và hiểu hơn.

## So sánh đối tượng

Trong JavaScript, đối tượng là kiểu tham chiếu. Hai đối tượng riêng biệt không bao giờ bằng nhau, dù chúng có cùng thuộc tính. Chỉ việc so sánh cùng một tham chiếu đối tượng với chính nó mới cho kết quả true.

```js
// Two variables, two distinct objects with the same properties
const fruit = { name: "apple" };
const anotherFruit = { name: "apple" };

fruit == anotherFruit; // return false
fruit === anotherFruit; // return false
```

```js
// Two variables, a single object
const fruit = { name: "apple" };
const anotherFruit = fruit; // Assign fruit object reference to anotherFruit

// Here fruit and anotherFruit are pointing to same object
fruit == anotherFruit; // return true
fruit === anotherFruit; // return true

fruit.name = "grape";
console.log(anotherFruit); // { name: "grape" }; not { name: "apple" }
```

Để biết thêm thông tin về toán tử so sánh, xem [equality operators](/en-US/docs/Web/JavaScript/Reference/Operators#equality_operators).

## Xem thêm

- [Inheritance and the prototype chain](/en-US/docs/Web/JavaScript/Guide/Inheritance_and_the_prototype_chain)
- [Classes](/en-US/docs/Web/JavaScript/Reference/Classes)

{{PreviousNext("Web/JavaScript/Guide/Regular_expressions", "Web/JavaScript/Guide/Using_classes")}}
