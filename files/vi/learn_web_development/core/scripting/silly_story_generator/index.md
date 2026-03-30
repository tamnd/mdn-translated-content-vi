---
title: "Thử thách: Trình tạo câu chuyện ngớ ngẩn"
short-title: "Thử thách: Trình tạo câu chuyện"
slug: Learn_web_development/Core/Scripting/Silly_story_generator
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Test_your_skills/Arrays", "Learn_web_development/Core/Scripting/Conditionals", "Learn_web_development/Core/Scripting")}}

Trong thử thách này, bạn được giao nhiệm vụ lấy một số kiến thức bạn đã học trong module này và áp dụng nó để tạo một ứng dụng vui tạo ra các câu chuyện ngớ ngẩn ngẫu nhiên. Trong quá trình thực hiện, chúng ta sẽ kiểm tra kiến thức của bạn về biến, toán học, chuỗi và mảng. Chúc vui vẻ!

## Điểm khởi đầu

Để bắt đầu, hãy nhấp nút **Play** trong một trong các panel mã dưới đây để mở ví dụ được cung cấp trong MDN Playground. Sau đó bạn sẽ làm theo các hướng dẫn trong phần [Tóm tắt dự án](#project_brief) để hoàn thành chức năng JavaScript.

```html live-sample___silly-story-start live-sample___silly-story-finish
<div>
  <label for="custom-name">Enter custom name:</label>
  <input id="custom-name" type="text" placeholder="" />
</div>
<fieldset>
  <legend>Choose locale:</legend>
  <label for="us">US</label
  ><input id="us" type="radio" name="uk-us" value="us" checked />
  <label for="uk">UK</label
  ><input id="uk" type="radio" name="uk-us" value="uk" />
</fieldset>
<div>
  <button class="generate">Generate random story</button>
</div>
<!-- Thanks a lot to Willy Aguirre for his help with the code for this assessment -->
<p class="story"></p>
```

```css hidden live-sample___silly-story-start live-sample___silly-story-finish
body {
  font: 1.2em / 1.5 system-ui;
  margin: 0 auto;
  width: 500px;
}

fieldset {
  border: 0;
}

fieldset,
legend {
  padding: 0;
  margin: 0;
}

input[type="text"] {
  margin-top: 5px;
  padding: 5px;
  width: 50%;
  display: block;
}

div,
fieldset {
  margin-top: 20px;
}

p {
  margin-top: 10px;
  background: #ffc125;
  padding: 20px;
  visibility: hidden;
}
```

```js live-sample___silly-story-start
// Complete variable definitions and random functions

const customName = document.getElementById("custom-name");
const generateBtn = document.querySelector(".generate");
const story = document.querySelector(".story");

function randomValueFromArray(array) {
  const random = Math.floor(Math.random() * array.length);
  return array[random];
}

// Raw text strings

// Willy the Goblin
// Big Daddy
// Father Christmas

// the soup kitchen
// Disneyland
// the White House

// spontaneously combusted
// melted into a puddle on the sidewalk
// turned into a slug and slithered away

// Partial return random string function

function returnRandomStoryString() {
  // It was 94 Fahrenheit outside, so :insertx: went for a walk. When they got to :inserty:, they stared in horror for a few moments, then :insertz:. Bob saw the whole thing, but was not surprised — :insertx: weighs 300 pounds, and it was a hot day.

  return storyText;
}

// Event listener and partial generate function definition

generateBtn.addEventListener("click", generateStory);

function generateStory() {
  if (customName.value !== "") {
    const name = customName.value;
  }

  if (document.getElementById("uk").checked) {
    const weight = Math.round(300);
    const temperature = Math.round(94);
  }

  // TODO: replace "" with the correct expression
  story.textContent = "";
  story.style.visibility = "visible";
}
```

{{EmbedLiveSample("silly-story-start", "100%", 300)}}

## Tóm tắt dự án

Bạn được cung cấp một vài chuỗi văn bản và các hàm JavaScript; bạn cần viết JavaScript cần thiết để biến nó thành chương trình hoạt động, thực hiện các việc sau:

- Tạo câu chuyện ngớ ngẩn khi nút "Generate random story" được nhấn.
- Thay thế tên mặc định "Bob" trong câu chuyện bằng tên tùy chỉnh, chỉ khi tên tùy chỉnh được nhập vào trường văn bản "Enter custom name" trước khi nút tạo được nhấn.
- Chuyển đổi số lượng và đơn vị cân nặng và nhiệt độ mặc định của Mỹ trong câu chuyện sang tương đương Anh nếu nút radio UK được chọn trước khi nút tạo được nhấn.
- Tạo câu chuyện ngớ ngẩn ngẫu nhiên mới mỗi khi nút được nhấn.

### Biến và hàm ban đầu

Trong JavaScript, bên dưới nhận xét "Complete variable definitions and random function", bạn có ba hằng số lưu tham chiếu đến:

- Trường văn bản "Enter custom name": `customName`.
- Nút "Generate random story": `generateBtn`.
- Phần tử {{htmlelement("p")}} ở cuối thân HTML nơi câu chuyện sẽ được sao chép vào: `story`.

Ngoài ra, bạn có hàm gọi là `randomValueFromArray()` nhận mảng làm đầu vào và trả về ngẫu nhiên một trong các mục được lưu bên trong mảng.

Bên dưới nhận xét "Raw text strings", bạn có một số chuỗi văn bản được đặt thành nhận xét sẽ đóng vai trò là đầu vào cho chương trình của chúng ta. Chúng tôi muốn bạn bỏ nhận xét các chuỗi này và lưu chúng bên trong các hằng số như sau:

1. Lưu bộ ba chuỗi đầu tiên bên trong mảng gọi là `characters`.
2. Lưu bộ ba chuỗi thứ hai bên trong mảng gọi là `places`.
3. Lưu bộ ba chuỗi thứ ba bên trong mảng gọi là `events`.

### Hoàn thành hàm `returnRandomStoryString()`

Bên dưới nhận xét "Partial return random string function", bạn có hàm `returnRandomStoryString()` được hoàn thành một phần chứa chuỗi văn bản dài được đặt thành nhận xét và câu lệnh `return` trả về giá trị gọi là `storyText`.

Để hoàn thành hàm này:

1. Bỏ nhận xét chuỗi văn bản dài và lưu nó bên trong biến gọi là `storyText`. Đây nên là template literal.
2. Thêm ba hằng số gọi là `randomCharacter`, `randomPlace`, và `randomEvent` ngay phía trên template literal. Những hằng này nên được đặt bằng ba lời gọi `randomValueFromArray()`, mỗi cái trả về chuỗi ngẫu nhiên từ mảng `characters`, `places`, và `events` tương ứng.
3. Trong template literal, thay thế các trường hợp `:insertx:`, `:inserty:`, và `:insertz:` bằng các biểu thức nhúng chứa `randomCharacter`, `randomPlace`, và `randomEvent` tương ứng.

### Hoàn thành hàm `generateStory()`

Bên dưới nhận xét "Event listener and partial generate function definition", bạn có một vài mục mã:

- Dòng thêm trình lắng nghe sự kiện `click` vào biến `generateBtn` sao cho khi nút nó đại diện được nhấp, hàm `generateStory()` được chạy.
- Định nghĩa hàm `generateStory()` được hoàn thành một phần. Cho phần còn lại của thử thách, bạn sẽ điền vào các dòng bên trong hàm này để hoàn thành và làm cho nó hoạt động đúng cách.

Làm theo các bước sau để hoàn thành hàm:

1. Tạo biến mới gọi là `newStory`, và đặt giá trị của nó bằng lời gọi `returnRandomStoryString()`. Hàm này cần thiết để chúng ta có thể tạo câu chuyện ngẫu nhiên mới mỗi khi nút được nhấn. Nếu chúng ta đặt `newStory` trực tiếp thành `storyText`, chúng ta chỉ có thể tạo câu chuyện mới một lần.
2. Bên trong khối `if` đầu tiên, thêm lời gọi phương thức thay thế chuỗi để thay thế tên `Bob` được tìm thấy trong chuỗi `newStory` bằng biến `name`. Trong khối này, chúng ta đang nói "Nếu một giá trị đã được nhập vào đầu vào văn bản `customName`, hãy thay thế `Bob` trong câu chuyện bằng tên tùy chỉnh đó."
3. Bên trong khối `if` thứ hai, chúng ta đang kiểm tra xem nút radio `uk` có được chọn không. Nếu có, chúng ta muốn chuyển đổi các giá trị cân nặng và nhiệt độ trong câu chuyện từ pound và Fahrenheit sang stone và Celsius. Những gì bạn cần làm như sau:
   1. Tìm công thức chuyển đổi pound sang stone và Fahrenheit sang Celsius.
   2. Bên trong dòng định nghĩa hằng số `weight`, thay thế `300` bằng phép tính chuyển đổi 300 pound sang stone. Nối `" stone"` vào cuối kết quả của lời gọi `Math.round()` tổng thể.
   3. Bên trong dòng định nghĩa biến `temperature`, thay thế `94` bằng phép tính chuyển đổi 94 Fahrenheit sang Celsius. Nối `" Celsius"` vào cuối kết quả của lời gọi `Math.round()` tổng thể.
   4. Ngay dưới hai định nghĩa biến, thêm thêm hai dòng thay thế chuỗi thay thế `300 pounds` bằng nội dung của biến `weight`, và `94 Fahrenheit` bằng nội dung của biến `temperature`.
4. Cuối cùng, trong dòng thứ hai từ cuối của hàm, đặt thuộc tính `textContent` của biến `story` (tham chiếu đoạn văn) bằng `newStory`.

## Gợi ý và mẹo

- Bạn không cần chỉnh sửa HTML và CSS theo bất kỳ cách nào.
- [`Math.round()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/round) là phương thức JavaScript tích hợp sẵn làm tròn kết quả của phép tính đến số nguyên gần nhất.
- Có ba trường hợp chuỗi cần được thay thế. Bạn có thể sử dụng phương thức `replace()`, hoặc một số giải pháp khác.

## Ví dụ

Ứng dụng hoàn chỉnh của bạn sẽ hoạt động như ví dụ trực tiếp sau:

{{EmbedLiveSample("silly-story-finish", "100%", 500)}}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh sẽ trông giống như thế này:

```js live-sample___silly-story-finish
// Complete variable definitions and random function

const customName = document.getElementById("custom-name");
const generateBtn = document.querySelector(".generate");
const story = document.querySelector(".story");

function randomValueFromArray(array) {
  const random = Math.floor(Math.random() * array.length);
  return array[random];
}

// Solution: Raw text strings

const characters = ["Willy the Goblin", "Big Daddy", "Father Christmas"];
const places = ["the soup kitchen", "Disneyland", "the White House"];
const events = [
  "spontaneously combusted",
  "melted into a puddle on the sidewalk",
  "turned into a slug and slithered away",
];

// Solution: Partial return random string function

function returnRandomStoryString() {
  const randomCharacter = randomValueFromArray(characters);
  const randomPlace = randomValueFromArray(places);
  const randomEvent = randomValueFromArray(events);

  let storyText = `It was 94 Fahrenheit outside, so ${randomCharacter} went for a walk. When they got to ${randomPlace}, they stared in horror for a few moments, then ${randomEvent}. Bob saw the whole thing, but was not surprised — ${randomCharacter} weighs 300 pounds, and it was a hot day.`;

  return storyText;
}

// Solution: Event listener and partial generate function definition

generateBtn.addEventListener("click", generateStory);

function generateStory() {
  let newStory = returnRandomStoryString();

  if (customName.value !== "") {
    const name = customName.value;
    newStory = newStory.replace("Bob", name);
  }

  if (document.getElementById("uk").checked) {
    const weight = `${Math.round(300 / 14)} stone`;
    const temperature = `${Math.round((94 - 32) * (5 / 9))} Celsius`;
    newStory = newStory.replace("300 pounds", weight);
    newStory = newStory.replace("94 Fahrenheit", temperature);
  }

  story.textContent = newStory;
  story.style.visibility = "visible";
}
```

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Test_your_skills/Arrays", "Learn_web_development/Core/Scripting/Conditionals", "Learn_web_development/Core/Scripting")}}
