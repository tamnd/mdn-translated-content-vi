---
title: "Thử thách: Thư viện ảnh"
slug: Learn_web_development/Core/Scripting/Image_gallery
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/DOM_scripting","Learn_web_development/Core/Scripting/Network_requests", "Learn_web_development/Core/Scripting")}}

Trong thử thách này, chúng ta sẽ yêu cầu bạn xây dựng một mục phổ biến mà bạn sẽ thấy trên nhiều trang web — thư viện ảnh được điều khiển bằng JavaScript. Trong quá trình thực hiện, bạn sẽ được kiểm tra kiến thức về vòng lặp, hàm, câu lệnh điều kiện, sự kiện, DOM scripting và kiến thức cơ bản về đối tượng.

## Điểm khởi đầu

Để bắt đầu, hãy nhấp nút **Play** trong một trong các panel mã dưới đây để mở ví dụ được cung cấp trong MDN Playground. Sau đó bạn sẽ làm theo các hướng dẫn trong phần [Tóm tắt dự án](#project_brief) để hoàn thành chức năng JavaScript.

HTML trông như thế này:

```html live-sample___gallery-start live-sample___gallery-finish
<h1>Image gallery example</h1>

<div class="full-img">
  <img
    class="displayed-img"
    src="https://mdn.github.io/shared-assets/images/examples/learn/gallery/pic1.jpg"
    alt="Closeup of a human eye" />
  <div class="overlay"></div>
  <button class="dark">Darken</button>
</div>

<div class="thumb-bar"></div>
```

JavaScript khởi đầu trông như thế này:

```js live-sample___gallery-start
const displayedImage = document.querySelector(".displayed-img");
const thumbBar = document.querySelector(".thumb-bar");

const btn = document.querySelector("button");
const overlay = document.querySelector(".overlay");
```

{{EmbedLiveSample("gallery-start", "100%", 700)}}

```css hidden live-sample___gallery-start live-sample___gallery-finish
body {
  font-family: sans-serif;
  width: 640px;
  margin: 0 auto;
  background-color: lightgray;
}

h1 {
  text-align: center;
}

.full-img {
  position: relative;
  display: block;
  width: 640px;
  height: 480px;
  margin-bottom: 2px;
}

.overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 640px;
  height: 480px;
}

button {
  background: rgb(150 150 150 / 0.6);
  border: 1px solid #999999;
  position: absolute;
  cursor: pointer;
  top: 2px;
  left: 2px;
}

button:hover,
button:focus {
  color: rgb(150 150 150 / 1);
  background-color: black;
}

.thumb-bar {
  display: flex;
  gap: 2px;
  cursor: pointer;
}

.thumb-bar img {
  display: block;
  width: 100px;
  flex: 1;
}

.thumb-bar img:hover,
.thumb-bar img:focus {
  outline: 2px solid blue;
}
```

Chúng ta đã ẩn CSS thư viện để ngắn gọn, nhưng bạn có thể thấy nó khi bạn xem ứng dụng trong MDN Playground.

## Tóm tắt dự án

Bạn được cung cấp một số HTML, CSS và một vài dòng mã JavaScript. Công việc của bạn là làm theo các hướng dẫn bên dưới, viết JavaScript cần thiết để biến nó thành thư viện ảnh hoạt động được.

Thư viện sẽ bao gồm một ảnh lớn và một hàng thumbnail. Khi thumbnail được nhấp hoặc tab đến và nhấn <kbd>Enter</kbd>/<kbd>Return</kbd>, thumbnail đó sẽ hiển thị như ảnh lớn. Phần tử `<img>` liên quan cũng nên được cập nhật với văn bản `alt` đúng.

Ở góc trên bên trái có một nút, khi được nhấn nhiều lần, chuyển đổi ảnh lớn giữa màu tối hơn và sáng hơn, đạt được bằng cách thay đổi độ trong suốt của phần tử `<div>` được phủ lên trên ảnh lớn.

Các ảnh bạn cần nhúng vào ví dụ và văn bản `alt` yêu cầu của chúng như sau:

- [`pic1.jpg`](https://mdn.github.io/shared-assets/images/examples/learn/gallery/pic1.jpg): "Closeup of a human eye".
- [`pic2.jpg`](https://mdn.github.io/shared-assets/images/examples/learn/gallery/pic2.jpg): "Rock that looks like a wave".
- [`pic3.jpg`](https://mdn.github.io/shared-assets/images/examples/learn/gallery/pic3.jpg): "Purple and white pansies".
- [`pic4.jpg`](https://mdn.github.io/shared-assets/images/examples/learn/gallery/pic4.jpg): "Section of wall from a pharaoh's tomb".
- [`pic5.jpg`](https://mdn.github.io/shared-assets/images/examples/learn/gallery/pic5.jpg): "Large moth on a leaf".

### Tạo đối tượng dữ liệu

Trước tiên, chúng ta muốn bạn khai báo một mảng đối tượng gọi là `images`. Mỗi đối tượng nên chứa hai thuộc tính:

- `filename`: Tên của tệp ảnh (không phải URL đầy đủ).
- `alt`: Văn bản `alt` của ảnh.

### Thêm ảnh vào thanh thumbnail

Tiếp theo, chúng ta muốn bạn lặp qua `images` và sử dụng một số DOM scripting để nhúng tất cả chúng vào trang thông qua các phần tử `<img>`. Chúng nên được bao gồm như con của phần tử `<div>` với lớp `thumb-bar`, mà chúng ta đã tham chiếu trong hằng số `thumbBar`.

1. Tạo hằng số gọi là `baseURL` chứa URL cơ sở của mỗi tệp ảnh (tất cả URL không bao gồm tên tệp).
2. Tạo vòng lặp `for ... of` để lặp qua `images`.
3. Đối với mỗi ảnh, tạo phần tử `<img>` mới.
4. Đặt nguồn `<img>` bằng URL của ảnh, nên là kết hợp của `baseURL` và `filename`, và thuộc tính `alt` bằng văn bản alt.
5. Thêm thuộc tính khác vào `<img>` để làm cho nó có thể focus qua bàn phím.
6. Thêm `<img>` vào `thumbBar`.
7. Thêm trình xử lý sự kiện `click` vào `<img>` sao cho khi được nhấp, hàm gọi là `updateDisplayedImage()` được chạy, hiển thị ảnh được nhấp ở kích thước đầy đủ. Bạn sẽ tạo hàm này sau.
8. Thêm trình xử lý sự kiện khác vào `<img>` sao cho khi nó được focus qua bàn phím, ảnh được nhấp có thể được hiển thị ở kích thước đầy đủ bằng cách nhấn phím <kbd>Enter</kbd>/<kbd>Return</kbd> (và không có phím nào khác). Đây là mục tiêu mở rộng cần nghiên cứu thêm để tìm ra.

### Tạo hàm `updateDisplayedImage()`

Bây giờ là lúc tạo hàm để hiển thị thumbnail được kích hoạt ở kích thước đầy đủ. Chúng ta đã lưu tham chiếu đến phần tử `<img>` kích thước đầy đủ trong hằng số `displayedImage`.

1. Định nghĩa hàm `updateDisplayedImage()`.
2. Bên trong thân hàm, đặt nguồn `displayedImage` bằng nguồn của `<img>` đã được kích hoạt.
3. Đặt văn bản alt `displayedImage` bằng văn bản alt của `<img>` đã được kích hoạt.

### Kết nối nút Darken/Lighten

Chúng ta đã lưu tham chiếu đến `<button>` "Darken/Lighten" trong hằng số `btn`, và tham chiếu đến `<div>` trong suốt chúng ta đã phủ lên trên `<img>` kích thước đầy đủ trong hằng số `overlay`. Chúng tôi muốn bạn:

1. Thêm trình xử lý sự kiện `click` vào `<button>` với hàm ẩn danh được đặt làm hàm xử lý.
2. Bên trong thân hàm, thêm cấu trúc điều kiện kiểm tra xem `<button>` có lớp `dark` được đặt trên nó hay không.
3. Nếu `<button>` có lớp `dark` khi được nhấp, thay đổi nội dung văn bản của nó thành `Lighten`, và thay đổi màu nền của phần tử `overlay` thành `rgb(0 0 0 / 0.5)`. Xóa lớp `dark` của phần tử `<button>`.
4. Nếu `<button>` _không_ có lớp `dark` khi được nhấp, thay đổi nội dung văn bản của nó thành `Darken`, và thay đổi màu nền của phần tử `overlay` thành `rgb(0 0 0 / 0)`. Thêm lớp `dark` của phần tử `<button>`.
5. Bạn có thể nghĩ ra cách để chuyển đổi lớp `dark` bằng một dòng mã duy nhất, chạy sau cấu trúc điều kiện không? Đây là mục tiêu mở rộng khác, hãy thử.

## Gợi ý và mẹo

- Bạn không cần thay đổi HTML hoặc CSS.

## Ví dụ

Ứng dụng hoàn chỉnh của bạn sẽ hoạt động như ví dụ trực tiếp sau:

{{EmbedLiveSample("gallery-finish", "100%", 700)}}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh sẽ trông giống như thế này:

```js live-sample___gallery-finish
const displayedImage = document.querySelector(".displayed-img");
const thumbBar = document.querySelector(".thumb-bar");

const btn = document.querySelector("button");
const overlay = document.querySelector(".overlay");

// Solution: Create a data object

const images = [
  { filename: "pic1.jpg", alt: "Closeup of a human eye" },
  { filename: "pic2.jpg", alt: "Rock that looks like a wave" },
  { filename: "pic3.jpg", alt: "Purple and white pansies" },
  { filename: "pic4.jpg", alt: "Section of wall from a pharaoh's tomb" },
  { filename: "pic5.jpg", alt: "Large moth on a leaf" },
];

// Solution: Loop through the images

// Create a baseURL constant containing the baseURL of the images
const baseURL =
  "https://mdn.github.io/shared-assets/images/examples/learn/gallery/";

// Loop through the images using a for...of loop
for (const image of images) {
  // Create a new image element
  const newImage = document.createElement("img");
  // Set the source and alt text for the image
  newImage.src = `${baseURL}${image.filename}`;
  newImage.alt = image.alt;
  // Make the image focusable via the keyboard
  newImage.tabIndex = "0";
  // Append the image as a child of the thumbBar
  thumbBar.appendChild(newImage);
  // Update the display to show the image full size when a thumb is clicked
  newImage.addEventListener("click", updateDisplayedImage);
  // Update the display to show the image full size when the "Enter" key
  // is pressed after it has been focused
  newImage.addEventListener("keydown", (e) => {
    if (e.code === "Enter") {
      updateDisplayedImage(e);
    }
  });
}

// Solution: Create the updateDisplayedImage() function

function updateDisplayedImage(e) {
  displayedImage.src = e.target.src;
  displayedImage.alt = e.target.alt;
}

// Solution: Wire up the Darken/Lighten button

// Add a click event listener on the button
btn.addEventListener("click", () => {
  // If the button has a "dark" class set,
  // change text to "Lighten" and make the overlay darker
  if (btn.classList.contains("dark")) {
    btn.textContent = "Lighten";
    overlay.style.backgroundColor = "rgb(0 0 0 / 0.5)";
  } else {
    // Else, change text to "Darken" and make
    // the overlay lighter
    btn.textContent = "Darken";
    overlay.style.backgroundColor = "rgb(0 0 0 / 0)";
  }
  // Toggle the class ready for the next button press
  btn.classList.toggle("dark");
});
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Scripting/DOM_scripting","Learn_web_development/Core/Scripting/Network_requests", "Learn_web_development/Core/Scripting")}}
