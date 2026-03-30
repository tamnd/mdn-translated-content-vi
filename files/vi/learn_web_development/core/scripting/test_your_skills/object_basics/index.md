---
title: "Kiểm tra kỹ năng: Kiến thức cơ bản về đối tượng"
short-title: "Kiểm tra: Đối tượng"
slug: Learn_web_development/Core/Scripting/Test_your_skills/Object_basics
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Object_basics","Learn_web_development/Core/Scripting/DOM_scripting", "Learn_web_development/Core/Scripting")}}

Mục tiêu của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn đã hiểu bài viết [Kiến thức cơ bản về đối tượng JavaScript](/en-US/docs/Learn_web_development/Core/Scripting/Object_basics) hay chưa.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels).

## Kiến thức cơ bản về đối tượng 1

Trong nhiệm vụ này, bạn được cung cấp một đối tượng theo nghĩa đen, và chúng ta muốn bạn làm một số việc với nó.

Để hoàn thành nhiệm vụ:

1. Lưu giá trị của thuộc tính `name` vào biến `catName`, sử dụng ký hiệu ngoặc vuông.
2. Chạy phương thức `greeting()` sử dụng ký hiệu chấm (nó sẽ ghi lời chào ra console).
3. Cập nhật giá trị thuộc tính `color` thành `black`.

<!-- Code shared across examples -->

```html hidden live-sample___objects-1 live-sample___objects-2 live-sample___objects-3 live-sample___objects-4 live-sample___objects-1-finish live-sample___objects-2-finish live-sample___objects-4-finish
<section></section>
```

```css hidden live-sample___objects-1 live-sample___objects-2 live-sample___objects-3 live-sample___objects-4 live-sample___objects-1-finish live-sample___objects-2-finish live-sample___objects-4-finish
* {
  box-sizing: border-box;
}

p {
  color: purple;
  margin: 0.5em 0;
}
```

<!-- Example-specific code -->

Điểm khởi đầu của nhiệm vụ trông như thế này (chưa có gì hiển thị):

{{ EmbedLiveSample("objects-1", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___objects-1
const cat = {
  name: "Bertie",
  breed: "Cymric",
  color: "white",
  greeting: function () {
    console.log("Meow!");
  },
};

// Don't edit the code above here!

// Add your code here

// Don't edit the code below here!

const section = document.querySelector("section");
let para1 = document.createElement("p");
let para2 = document.createElement("p");
para1.textContent = `The cat's name is ${catName}.`;
para2.textContent = `The cat's color is ${cat.color}.`;
section.appendChild(para1);
section.appendChild(para2);
```

Đầu ra cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("objects-1-finish", "100%", 80) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
// ...
// Don't edit the code above here!

const catName = cat["name"];
cat.greeting();
cat.color = "black";

// Don't edit the code below here!
// ...
```

```js hidden live-sample___objects-1-finish
const cat = {
  name: "Bertie",
  breed: "Cymric",
  color: "white",
  greeting: function () {
    console.log("Meow!");
  },
};

const catName = cat["name"];
cat.greeting();
cat.color = "black";

const section = document.querySelector("section");
let para1 = document.createElement("p");
let para2 = document.createElement("p");
para1.textContent = `The cat's name is ${catName}.`;
para2.textContent = `The cat's color is ${cat.color}.`;
section.appendChild(para1);
section.appendChild(para2);
```

</details>

## Kiến thức cơ bản về đối tượng 2

Trong nhiệm vụ tiếp theo, chúng ta muốn bạn thử tạo đối tượng theo nghĩa đen của riêng mình để đại diện cho một trong những ban nhạc yêu thích của bạn.

Để hoàn thành nhiệm vụ:

1. Tạo đối tượng theo nghĩa đen gọi là `band`, chứa các thuộc tính sau:
   - `name`: Một chuỗi đại diện cho tên ban nhạc.
   - `nationality`: Một chuỗi đại diện cho quốc gia ban nhạc đến từ.
   - `genre`: Loại nhạc ban nhạc chơi.
   - `members`: Một số đại diện cho số lượng thành viên ban nhạc.
   - `formed`: Một số đại diện cho năm ban nhạc thành lập.
   - `split`: Một số đại diện cho năm ban nhạc tan rã, hoặc `false` nếu họ vẫn còn hoạt động.
   - `albums`: Một mảng đại diện cho các album được phát hành bởi ban nhạc. Mỗi phần tử mảng nên là một đối tượng chứa các thành viên sau:
     - `name`: Một chuỗi đại diện cho tên album.
     - `released`: Một số đại diện cho năm album được phát hành.
       > [!NOTE]
       > Bao gồm ít nhất hai album trong mảng `albums`.
2. Viết một chuỗi vào biến `bandInfo`, sẽ chứa tiểu sử ngắn với thông tin về tên, quốc tịch, năm hoạt động, và phong cách của họ, cũng như tiêu đề và ngày phát hành của album đầu tiên.

Điểm khởi đầu của nhiệm vụ trông như thế này (chưa có gì hiển thị):

{{ EmbedLiveSample("objects-2", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___objects-2
let bandInfo;

// Don't edit the code above here!

// Add your code here

// Don't edit the code below here!

const section = document.querySelector("section");
let para1 = document.createElement("p");
para1.textContent = bandInfo;
section.appendChild(para1);
```

Đầu ra cập nhật sẽ trông giống như thế này:

{{ EmbedLiveSample("objects-2-finish", "100%", 60) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
// ...
// Don't edit the code above here!

const band = {
  name: "Black Sabbath",
  nationality: "British",
  genre: "heavy metal",
  members: 4,
  formed: 1968,
  split: 2025,
  albums: [
    {
      name: "Black Sabbath",
      released: 1970,
    },
    {
      name: "Paranoid",
      released: 1970,
    },
    {
      name: "Master of Reality",
      released: 1971,
    },
    {
      name: "Vol. 4",
      released: 1972,
    },
  ],
};

bandInfo = `The ${band.nationality} ${band.genre} band ${band.name} were active between ${band.formed} and ${band.split}. Their first album, ${band.albums[0].name}, was released in ${band.albums[0].released}.`;

// Don't edit the code below here!
// ...
```

```js hidden live-sample___objects-2-finish
let bandInfo;

const band = {
  name: "Black Sabbath",
  nationality: "British",
  genre: "heavy metal",
  members: 4,
  formed: 1968,
  split: 2025,
  albums: [
    {
      name: "Black Sabbath",
      released: 1970,
    },
    {
      name: "Paranoid",
      released: 1970,
    },
    {
      name: "Master of Reality",
      released: 1971,
    },
    {
      name: "Vol. 4",
      released: 1972,
    },
  ],
};

bandInfo = `The ${band.nationality} ${band.genre} band ${band.name} were active between ${band.formed} and ${band.split}. Their first album, ${band.albums[0].name}, was released in ${band.albums[0].released}.`;

const section = document.querySelector("section");
let para1 = document.createElement("p");
para1.textContent = bandInfo;
section.appendChild(para1);
```

</details>

## Kiến thức cơ bản về đối tượng 3

Trong nhiệm vụ này, chúng ta muốn bạn quay lại đối tượng `cat` từ Kiến thức cơ bản về đối tượng 1.

Để hoàn thành nhiệm vụ:

1. Viết lại phương thức `greeting()` để nó ghi `"Hello, said Bertie the Cymric."` ra console trình duyệt, nhưng theo cách sẽ hoạt động với _bất kỳ_ đối tượng mèo nào có cùng cấu trúc, bất kể tên hay giống của nó.
2. Viết đối tượng của riêng bạn gọi là `cat2`, có cùng cấu trúc và phương thức `greeting()`, nhưng `name`, `breed`, và `color` khác.
3. Gọi cả hai phương thức `greeting()` để kiểm tra chúng ghi lời chào phù hợp ra console.

Điểm khởi đầu của nhiệm vụ trông như thế này (chưa có gì hiển thị):

{{ EmbedLiveSample("objects-3", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___objects-3
const cat = {
  name: "Bertie",
  breed: "Cymric",
  color: "white",
  greeting: function () {
    console.log("Meow!");
  },
};

// Don't edit the code above here!

// Add your code here
```

Chúng ta chưa cung cấp nội dung hoàn chỉnh cho nhiệm vụ này vì nó không in gì ra DOM. Đầu ra tất cả được ghi vào console.

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
// ...
// Don't edit the code above here!

const cat2 = {
  name: "Elfie",
  breed: "Aphrodite Giant",
  color: "ginger",
  greeting: function () {
    console.log(`Hello, said ${this.name} the ${this.breed}.`);
  },
};

cat.greeting();
cat2.greeting();
```

```js hidden
const cat = {
  name: "Bertie",
  breed: "Cymric",
  color: "white",
  greeting: function () {
    console.log("Meow!");
  },
};

const cat2 = {
  name: "Elfie",
  breed: "Aphrodite Giant",
  color: "ginger",
  greeting: function () {
    console.log(`Hello, said ${this.name} the ${this.breed}.`);
  },
};

cat.greeting();
cat2.greeting();
```

</details>

## Kiến thức cơ bản về đối tượng 4

Trong mã bạn đã viết cho Nhiệm vụ 3, phương thức `greeting()` và các thuộc tính được định nghĩa hai lần, một lần cho mỗi con mèo. Điều này không lý tưởng: đặc biệt, nó vi phạm một nguyên tắc trong lập trình gọi là [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) hay "Không lặp lại chính mình". Trong nhiệm vụ này, chúng ta muốn bạn cải thiện mã để các thành viên đối tượng chỉ được định nghĩa một lần.

Để hoàn thành nhiệm vụ:

1. Tạo lớp JavaScript định nghĩa các thể hiện mèo
2. Sử dụng lớp của bạn cùng với từ khóa `new` để tạo các thể hiện `cat` và `cat2`.

Điểm khởi đầu của nhiệm vụ trông như thế này (chưa có gì hiển thị):

{{ EmbedLiveSample("objects-4", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___objects-4
const cat = {
  name: "Bertie",
  breed: "Cymric",
  color: "white",
  greeting: function () {
    console.log(`Hello, said ${this.name} the ${this.breed}.`);
  },
};

const cat2 = {
  name: "Elfie",
  breed: "Aphrodite Giant",
  color: "ginger",
  greeting: function () {
    console.log(`Hello, said ${this.name} the ${this.breed}.`);
  },
};

// Don't edit the code below here!

cat.greeting();
cat2.greeting();
```

Chúng ta chưa cung cấp nội dung hoàn chỉnh cho nhiệm vụ này vì nó không in gì ra DOM. Đầu ra tất cả được ghi vào console.

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
class Cat {
  constructor(name, breed, color) {
    this.name = name;
    this.breed = breed;
    this.color = color;
  }
  greeting() {
    console.log(`Hello, said ${this.name} the ${this.breed}.`);
  }
}

const cat = new Cat("Bertie", "Cymric", "white");
const cat2 = new Cat("Elfie", "Aphrodite Giant", "ginger");

// Don't edit the code below here!
// ...
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Object_basics","Learn_web_development/Core/Scripting/DOM_scripting", "Learn_web_development/Core/Scripting")}}
