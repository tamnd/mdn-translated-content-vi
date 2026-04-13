---
title: "Highlight: priority property"
short-title: priority
slug: Web/API/Highlight/priority
page-type: web-api-instance-property
browser-compat: api.Highlight.priority
---

{{APIRef("CSS Custom Highlight API")}}

Thuộc tính `priority` của giao diện {{domxref("Highlight")}} là một số được dùng để xác định kiểu của vùng làm nổi bật nào sẽ được dùng để giải quyết xung đột kiểu trong các phần chồng lên nhau. Các vùng làm nổi bật có số `priority` cao hơn sẽ được ưu tiên hơn những vùng có `priority` thấp hơn.

Có thể tạo các đối tượng {{domxref("Range")}} chồng lên nhau trong một tài liệu.

Khi các phạm vi chồng lên nhau được dùng bởi nhiều đối tượng {{domxref("Highlight")}} khác nhau, và khi các vùng làm nổi bật đó được tạo kiểu bằng các phần tử giả {{cssxref("::highlight")}}, điều này có thể dẫn đến xung đột kiểu.

Nếu hai phạm vi văn bản chồng lên nhau và cả hai đều được làm nổi bật bằng {{domxref("css_custom_highlight_api", "CSS Custom Highlight API", "", "nocode")}}, và nếu cả hai đều được tạo kiểu bằng thuộc tính CSS `color`, trình duyệt cần quyết định màu nào nên được sử dụng để tạo kiểu văn bản trong phần chồng lên nhau.

Nếu không có `priority` nào được đặt, tất cả các vùng làm nổi bật đều có cùng độ ưu tiên, và trình duyệt chọn vùng làm nổi bật được đăng ký gần đây nhất để tạo kiểu cho các phần chồng lên nhau.

Lưu ý rằng tất cả các kiểu của một vùng làm nổi bật được áp dụng và trình duyệt chỉ cần giải quyết xung đột khi cùng một thuộc tính CSS được sử dụng bởi nhiều vùng làm nổi bật chồng lên nhau. Việc giải quyết xung đột kiểu của vùng làm nổi bật cũng không phụ thuộc vào thứ tự các quy tắc phần tử giả {{cssxref("::highlight")}} xuất hiện trong nguồn, hoặc liệu các thuộc tính CSS có được đánh dấu là `!important` hay không.

## Giá trị

Một số nguyên.

## Ví dụ

### Độ ưu tiên mặc định

#### HTML

```html
<p>Time is an illusion. Lunchtime doubly so.</p>
```

#### CSS

```css
::highlight(highlight-2) {
  color: blue;
}

::highlight(highlight-1) {
  color: white;
  background: orange;
}
```

#### JavaScript

```js
const text = document.querySelector("p").firstChild;

// Create two overlapping highlights
const range1 = new Range();
range1.setStart(text, 5);
range1.setEnd(text, 25);

const range2 = new Range();
range2.setStart(text, 15);
range2.setEnd(text, 35);

const highlight1 = new Highlight(range1);
const highlight2 = new Highlight(range2);

CSS.highlights.set("highlight-1", highlight1);
CSS.highlights.set("highlight-2", highlight2);
```

#### Kết quả

Như thấy bên dưới, theo mặc định, phần của nút văn bản nơi hai vùng làm nổi bật đã đăng ký chồng lên nhau được hiển thị bằng màu xanh vì `highlight-2` được đăng ký sau `highlight-1`. Màu nền được xác định bởi `highlight-1` bao gồm toàn bộ phạm vi `range1` vì nó không xung đột với màu nền khác.

{{EmbedLiveSample("Default priority")}}

### Đặt độ ưu tiên

#### HTML

```html
<button id="prioritize-1" type="button">Prioritize 1</button>
<button id="prioritize-2" type="button">Prioritize 2</button>
<button id="reset" type="button">Reset</button>
<p>Time is an illusion. Lunchtime doubly so.</p>
```

#### CSS

```css
::highlight(highlight-1) {
  background-color: blue;
  color: white;
}

::highlight(highlight-2) {
  background-color: orange;
}
```

#### JavaScript

```js
const text = document.querySelector("p").firstChild;

// Create two overlapping highlights
const range1 = new Range();
range1.setStart(text, 5);
range1.setEnd(text, 25);

const range2 = new Range();
range2.setStart(text, 15);
range2.setEnd(text, 35);

const highlight1 = new Highlight(range1);
const highlight2 = new Highlight(range2);

CSS.highlights.set("highlight-1", highlight1);
CSS.highlights.set("highlight-2", highlight2);

// Add buttons to change the highlight priority.
const prioritize1 = document.querySelector("#prioritize-1");
const prioritize2 = document.querySelector("#prioritize-2");
const reset = document.querySelector("#reset");

prioritize1.addEventListener("click", () => {
  highlight1.priority = 1;
  highlight2.priority = 0;
});

prioritize2.addEventListener("click", () => {
  highlight1.priority = 0;
  highlight2.priority = 1;
});

reset.addEventListener("click", () => {
  highlight1.priority = 0;
  highlight2.priority = 0;
});
```

#### Kết quả

Như thấy bên dưới, theo mặc định, phần của nút văn bản nơi hai vùng làm nổi bật đã đăng ký chồng lên nhau được hiển thị bằng màu xanh vì `highlight-2` được đăng ký sau `highlight-1`.

{{EmbedLiveSample("Setting priority")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS Custom Highlight API: The Future of Highlighting Text Ranges on the Web](https://css-tricks.com/css-custom-highlight-api-early-look/)
