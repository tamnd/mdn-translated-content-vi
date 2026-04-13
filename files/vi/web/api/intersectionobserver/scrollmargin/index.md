---
title: "IntersectionObserver: scrollMargin property"
short-title: scrollMargin
slug: Web/API/IntersectionObserver/scrollMargin
page-type: web-api-instance-property
browser-compat: api.IntersectionObserver.scrollMargin
---

{{APIRef("Intersection Observer API")}}

Thuộc tính chỉ đọc **`scrollMargin`** của giao diện {{domxref("IntersectionObserver")}} thêm một lề vào tất cả các {{glossary("scroll container","scroll containers")}} lồng nhau trong phần tử gốc, bao gồm cả phần tử gốc nếu nó là vùng cuộn.

Điều này mở rộng hoặc thu nhỏ hình chữ nhật cắt xén của các vùng cuộn trước khi tính toán sự giao nhau.
Điều này cho phép bạn, ví dụ, điều chỉnh ranh giới của vùng cuộn để phần tử đích được coi là hiển thị ngay cả khi các pixel của nó chưa hiển thị trong viewport của vùng cuộn, hoặc coi đích là hiển thị một phần nếu một cạnh quá gần với cạnh của hộp giới hạn vùng cuộn.

Lưu ý rằng nếu phần tử gốc cũng là vùng cuộn, thì `scrollMargin` và {{domxref("IntersectionObserver/rootMargin","rootMargin")}} được kết hợp để xác định hình chữ nhật giới hạn hiệu quả dùng để tính toán sự giao nhau với đích.

Để biết thêm thông tin, xem [The intersection root and scroll margin](/en-US/docs/Web/API/Intersection_Observer_API#the_intersection_root_and_scroll_margin) trong tổng quan API.

## Giá trị

Một chuỗi, được định dạng tương tự như giá trị thuộc tính CSS {{cssxref("margin")}}.

Lề được chỉ định xác định các độ lệch cho một hoặc nhiều cạnh của hình chữ nhật cắt xén của vùng cuộn.
Nếu `scrollMargin` không được chỉ định khi đối tượng được khởi tạo, nó mặc định là chuỗi `"0px 0px 0px 0px"`.

## Ví dụ

### Băng chuyền với scroll margin

Ví dụ này định nghĩa một hộp có thể cuộn (phần tử gốc), chứa một băng chuyền hình ảnh ban đầu không trong tầm nhìn.
Một trình quan sát trên phần tử gốc quan sát các phần tử đích hình ảnh trong băng chuyền.
Khi một phần tử hình ảnh bắt đầu giao nhau với phần tử gốc, hình ảnh được tải, sự giao nhau được ghi lại, và trình quan sát bị gỡ bỏ.

Ví dụ cho phép bạn sửa đổi `scrollMargin` để xem cách thay đổi này ảnh hưởng đến thời điểm các đích trong vùng cuộn băng chuyền bắt đầu giao nhau.

#### HTML

```html hidden
<button id="reset" type="button">Reset</button>
```

Đoạn mã dưới đây định nghĩa phần tử `root-container` {{htmlelement("div")}}, mà chúng ta sẽ dùng làm phần tử gốc của trình quan sát giao nhau.
Phần tử này lần lượt chứa một phần tử {{htmlelement("p")}} dùng để đẩy các phần tử khác ra khỏi tầm nhìn "theo mặc định", một `carousel` `<div>`, và một `margin-indicator` (dùng để chỉ thị kích thước lề áp dụng cho các phần tử cuộn trong phần tử gốc).

Các phần tử {{htmlelement("img")}} trong băng chuyền có thuộc tính `data-src` chứa tên tệp.
Trong mã trình quan sát, chúng ta sẽ sử dụng thuộc tính này để đặt `img.src` khi mỗi hình ảnh bắt đầu giao nhau với phần tử gốc, từ đó tải hình ảnh.

```html
<div id="root-container">
  <p>content before (scroll down to carousel)</p>

  <div class="flex-container">
    <div class="carousel">
      <img
        src=""
        data-src="ballon-portrait.jpg"
        class="lazy-carousel-img"
        alt="Balloon portrait" />
      <img
        src=""
        data-src="balloon-small.jpg"
        class="lazy-carousel-img"
        alt="balloon-small" />
      <img
        src=""
        data-src="surfer.jpg"
        class="lazy-carousel-img"
        alt="surfer" />
      <img
        src=""
        data-src="border-diamonds.png"
        class="lazy-carousel-img"
        alt="border-diamonds" />
      <img src="" data-src="fire.png" class="lazy-carousel-img" alt="fire" />
      <img
        src=""
        data-src="puppy-header.jpg"
        class="lazy-carousel-img"
        alt="puppy" />
      <img src="" data-src="moon.jpg" class="lazy-carousel-img" alt="moon" />
      <img src="" data-src="rhino.jpg" class="lazy-carousel-img" alt="rhino" />
    </div>
    <div id="margin-indicator"></div>
  </div>
  <p>content after</p>
</div>
```

```html
<div class="controls">
  <label>
    Set the right margin of the scroll root:
    <input id="margin" type="number" value="0" step="5" />px
  </label>
</div>
```

```html hidden
<pre id="log"></pre>
```

#### CSS

```css
#root-container {
  height: 250px;
  overflow-y: auto;
  border: solid blue;
}

p {
  height: 50vh;
}

.flex-container {
  display: flex;
}

#margin-indicator {
  position: relative;
  height: 100px;
  width: 1px;
  background-color: red;
  opacity: 0.5;
  display: flex;
}

.carousel {
  width: 300px;
  overflow-x: auto;
  scroll-snap-type: x mandatory;
  display: flex;
  border: solid;
  /* outline: 200px solid rgba(0, 0, 0, 0.1); */
}
.carousel img {
  scroll-snap-stop: always;
  scroll-snap-align: start;
  display: block;
  width: 195px;
  height: 99px;
  min-width: 195px;
  min-height: 99px;
  margin-right: 10px;
  background-color: #eeeeee; /* Placeholder background */
}

.controls {
  margin-top: 10px;
}
```

```css hidden
#log {
  height: 100px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

#### JavaScript

```js hidden
const reload = document.querySelector("#reset");

reload.addEventListener("click", () => {
  window.location.reload(true);
});

const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

Phần đầu tiên của mã định nghĩa hàm `createImageObserver()` mà chúng ta sử dụng để tạo các đối tượng `IntersectionObserver` và gán cho biến `imageObserver`.
Chúng ta sử dụng một hàm vì các tùy chọn trình quan sát không thể thay đổi sau khi xây dựng, và chúng ta muốn có thể minh họa hiệu ứng của các giá trị `scrollMargin` khác nhau.

`IntersectionObserver` được tạo không có `rootMargin`, một `threshold` gần bằng không, và một `scrollMargin` lấy giá trị từ đầu vào `margin`, và sẽ được áp dụng cho tất cả các cạnh của vùng cuộn.

Callback được gọi cho tất cả các đích được quan sát.
Đối với các đích đang giao nhau, nó đặt `img.src` theo tên của hình ảnh cần tải (từ `img.dataset.src`), ghi lại sự giao nhau, rồi dừng quan sát hình ảnh.

Đoạn mã ở cuối hàm gọi {{domxref("IntersectionObserver.observe()")}} trên mỗi hình ảnh để bắt đầu trình quan sát.

```js
const rootContainer = document.getElementById("root-container");
const marginIndicator = document.getElementById("margin-indicator");
const carousel = document.querySelector(".carousel");
const lazyImages = carousel.querySelectorAll(".lazy-carousel-img");
let imageObserver;

function createImageObserver() {
  if (imageObserver) {
    imageObserver.disconnect();
  }

  let observerOptions = {
    root: rootContainer,
    rootMargin: "0px", // No extra margin
    scrollMargin: `${margin.valueAsNumber}px`, // No extra margin / Can be set
    threshold: 0.01, // Trigger when 1% of the image is visible
  };

  imageObserver = new IntersectionObserver((entries, observer) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        const img = entry.target;
        log(`intersect: ${img.dataset.src}`); // Only on first intersection
        img.src = `https://mdn.github.io/shared-assets/images/examples/${img.dataset.src}`; // Load image by setting src
        img.classList.remove("lazy-carousel-img"); // Remove the class
        observer.unobserve(img); // Stop observing once loaded
      }
    });
  }, observerOptions);

  if (margin.valueAsNumber < 0) {
    marginIndicator.style.width = `${-margin.valueAsNumber}px`;
    marginIndicator.style.left = `${margin.valueAsNumber}px`;
    marginIndicator.style.backgroundColor = "blue";
  } else {
    marginIndicator.style.width = `${margin.valueAsNumber}px`;
    marginIndicator.style.left = "0px";
    marginIndicator.style.backgroundColor = "green";
  }

  lazyImages.forEach((image) => {
    imageObserver.observe(image); // Start observing each image
  });
}
```

Đoạn mã sau tạo trình quan sát bằng `createImageObserver()` khi khởi động và mỗi khi giá trị đầu vào `margin` thay đổi.
Nếu giao diện `IntersectionObserver` không được hỗ trợ, tất cả hình ảnh được tải ngay lập tức.

```js
if ("IntersectionObserver" in window) {
  createImageObserver();
  margin.addEventListener("input", () => {
    createImageObserver();
  });
} else {
  // Fallback for browsers that don't support Intersection Observer
  // Loads all images immediately if Intersection Observer is not supported.
  lazyImages.forEach((img) => {
    img.src = img.dataset.src;
    img.classList.remove("lazy-carousel-img");
  });
  console.warn(
    "Intersection Observer not supported. All carousel images loaded.",
  );
}
```

#### Kết quả

Cuộn xuống để hiển thị băng chuyền.
Các hình ảnh hiển thị sẽ được tải ngay lập tức.
Nếu bạn cuộn băng chuyền sang phải, bạn sẽ thấy rằng các hình ảnh được tải ngay khi phần tử trở nên hiển thị.

Bạn có thể sử dụng điều khiển được cung cấp để thay đổi tỷ lệ phần trăm scroll margin (sau khi đặt lại ví dụ).
Nếu bạn đặt giá trị dương như 20px, hình chữ nhật cắt xén của vùng cuộn sẽ được tăng lên 20px, và bạn sẽ thấy rằng các hình ảnh được phát hiện và tải trước khi chúng vào tầm nhìn.
Tương tự, giá trị âm sẽ có nghĩa là sự giao nhau được phát hiện khi hình ảnh đã vào tầm nhìn.

{{EmbedLiveSample("Carousel with scroll margin","100%","500px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
