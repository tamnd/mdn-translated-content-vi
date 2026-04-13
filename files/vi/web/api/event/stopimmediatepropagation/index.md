---
title: "Event: phương thức stopImmediatePropagation()"
short-title: stopImmediatePropagation()
slug: Web/API/Event/stopImmediatePropagation
page-type: web-api-instance-method
browser-compat: api.Event.stopImmediatePropagation
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Phương thức **`stopImmediatePropagation()`** của giao diện
{{domxref("Event")}} ngăn các bộ lắng nghe khác của cùng một sự kiện được gọi.

Nếu có nhiều bộ lắng nghe được gắn vào cùng một phần tử cho cùng một loại sự kiện, chúng sẽ được gọi theo thứ tự chúng được thêm vào. Nếu `stopImmediatePropagation()` được gọi trong một lần gọi như vậy, sẽ không còn bộ lắng nghe nào khác được gọi, dù trên phần tử đó hay trên bất kỳ phần tử nào khác.

## Cú pháp

```js-nolint
stopImmediatePropagation()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### So sánh các hàm dừng sự kiện

Ví dụ dưới đây có ba nút nằm trong ba div lồng nhau. Mỗi nút có ba bộ lắng nghe sự kiện được đăng ký cho các sự kiện click, và mỗi div cũng có một bộ lắng nghe sự kiện, cũng được đăng ký cho các sự kiện click.

- Nút trên cùng cho phép sự kiện lan truyền bình thường.
- Nút ở giữa gọi `stopPropagation()` trong bộ xử lý sự kiện đầu tiên của nó.
- Nút dưới cùng gọi `stopImmediatePropagation()` trong bộ xử lý sự kiện đầu tiên của nó.

#### HTML

```html
<h2>Nhấp vào các nút</h2>
<div>
  div ngoài<br />
  <div>
    div giữa<br />
    <div>
      div trong<br />
      <button>cho phép lan truyền</button><br />
      <button id="stopPropagation">dừng lan truyền</button><br />
      <button id="stopImmediatePropagation">dừng lan truyền ngay</button>
    </div>
  </div>
</div>
<pre></pre>
```

#### CSS

```css
div {
  display: inline-block;
  padding: 10px;
  background-color: white;
  border: 2px solid black;
  margin: 10px;
}

button {
  width: 100px;
  color: #000088;
  padding: 5px;
  background-color: white;
  border: 2px solid black;
  border-radius: 30px;
  margin: 5px;
}
```

#### JavaScript

```js
const outElem = document.querySelector("pre");

/* Xóa đầu ra */
document.addEventListener(
  "click",
  () => {
    outElem.textContent = "";
  },
  true,
);

/* Thiết lập bộ lắng nghe sự kiện cho các nút */
document.querySelectorAll("button").forEach((elem) => {
  for (let i = 1; i <= 3; i++) {
    elem.addEventListener("click", (evt) => {
      /* Chỉ dừng lan truyền trong bộ xử lý sự kiện đầu tiên */
      if (i === 1 && elem.id) {
        evt[elem.id]();
        outElem.textContent += `Bộ xử lý sự kiện 1 gọi ${elem.id}()\n`;
      }

      outElem.textContent += `Sự kiện click ${i} được xử lý trên nút "${elem.textContent}"\n`;
    });
  }
});

/* Thiết lập bộ lắng nghe sự kiện cho các div */
document
  .querySelectorAll("div")
  .forEach((elem) =>
    elem.addEventListener(
      "click",
      (evt) =>
        (outElem.textContent += `Sự kiện click được xử lý trên "${elem.firstChild.data.trim()}"\n`),
    ),
  );
```

#### Kết quả

Mỗi bộ xử lý sự kiện click sẽ hiển thị một thông báo trạng thái khi được gọi. Nếu bạn nhấn nút ở giữa, bạn sẽ thấy `stopPropagation()` cho phép tất cả các bộ xử lý sự kiện click đã đăng ký cho chính nút đó được thực thi, nhưng ngăn các bộ xử lý sự kiện click cho các div, vốn bình thường sẽ chạy sau đó. Tuy nhiên, nếu bạn nhấn nút dưới cùng, `stopImmediatePropagation()` sẽ dừng mọi lan truyền sau sự kiện đã gọi nó.

{{ EmbedLiveSample("Comparing event-stopping functions", 500, 550) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
