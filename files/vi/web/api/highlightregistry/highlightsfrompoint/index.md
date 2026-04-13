---
title: "HighlightRegistry: highlightsFromPoint() method"
short-title: highlightsFromPoint()
slug: Web/API/HighlightRegistry/highlightsFromPoint
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.HighlightRegistry.highlightsFromPoint
---

{{APIRef("CSS Custom Highlight API")}}{{SeeCompatTable}}

Phương thức **`highlightsFromPoint()`** của giao diện {{domxref("HighlightRegistry")}} trả về một mảng các đối tượng đại diện cho các highlight tùy chỉnh được áp dụng tại một điểm cụ thể trong viewport.

## Cú pháp

```js-nolint
highlightsFromPoint(x, y)
highlightsFromPoint(x, y, options)
```

### Tham số

- `x`
  - : Tọa độ x của điểm trong viewport mà từ đó trả về thông tin highlight tùy chỉnh.
- `y`
  - : Tọa độ y của điểm trong viewport mà từ đó trả về thông tin highlight tùy chỉnh.
- `options` {{optional_inline}}
  - : Một đối tượng chứa các tùy chọn, có thể bao gồm:
    - `shadowRoots`
      - : Một mảng các đối tượng {{domxref("ShadowRoot")}}. Các highlight tùy chỉnh tồn tại tại điểm chỉ định bên trong các shadow root trong mảng cũng sẽ được đưa vào kết quả trả về, ngoài những highlight có trong light DOM. Mặc định, các highlight bên trong shadow root không được trả về.

### Giá trị trả về

Một mảng các đối tượng `HighlightHitResult` đại diện cho các highlight tùy chỉnh được áp dụng tại điểm trong viewport được xác định bởi tham số `x` và `y`.

Mỗi đối tượng `HighlightHitResult` chứa các thuộc tính sau:

- `highlight`
  - : Một đối tượng {{domxref("Highlight")}} đại diện cho highlight tùy chỉnh được áp dụng.
- `ranges`
  - : Một mảng các đối tượng {{domxref("AbstractRange")}} đại diện cho các range mà highlight tùy chỉnh được áp dụng.

Nếu không có highlight tùy chỉnh nào được áp dụng tại điểm chỉ định, hoặc điểm chỉ định nằm ngoài viewport, phương thức trả về một mảng rỗng.

## Ví dụ

### Xuất các highlight tùy chỉnh được áp dụng tại vị trí con trỏ chuột

Trong ví dụ này, bạn có thể áp dụng các highlight tùy chỉnh lên một đoạn văn bản. Các highlight tùy chỉnh này có thể chồng lên nhau. Khi người dùng nhấp đúp vào đoạn văn, chúng ta dùng phương thức `highlightsFromPoint()` để trả về nội dung của bất kỳ highlight tùy chỉnh nào tại tọa độ con trỏ chuột của thao tác nhấp đúp.

#### HTML

Markup bao gồm một phần tử {{htmlelement("p")}} chứa văn bản để áp dụng highlight tùy chỉnh, và một phần tử {{htmlelement("section")}} để xuất các đoạn văn bản được làm nổi bật.

```html live-sample___highlights-from-point-example
<h1>highlightsFromPoint() demo</h1>
<p class="highlightable-text">
  When you select a section of text then press "h" on the keyboard, the text you
  selected will be given a custom highlight. Multiple highlights will be colored
  yellow, red, and blue, in that order. When you double-click on a highlighted
  section of text, that section will be outputted at the bottom of the UI. If
  multiple highlights overlap the section, you'll see multiple text sections
  outputted.
</p>
<h2>Highlighted text at point</h2>
<section></section>
```

#### CSS

Trong CSS, chúng ta định nghĩa kiểu dáng cho ba highlight tùy chỉnh có tên `highlight1`, `highlight2` và `highlight3`. Chúng ta chọn mỗi highlight tùy chỉnh bằng cách truyền tên của nó vào phần tử giả {{cssxref("::highlight()")}}, gán màu nền vàng, đỏ và xanh dương cho chúng tương ứng.

```css hidden live-sample___highlights-from-point-example
* {
  box-sizing: border-box;
}

body {
  background-color: white;
  color: #333333;
  font:
    1em / 1.4 "Helvetica Neue",
    "Helvetica",
    "Arial",
    sans-serif;
  padding: 1em;
  max-width: 800px;
  margin: 0 auto;
}

section {
  display: flex;
  gap: 10px;
}

.highlightable-text,
article {
  padding: 10px;
  background-color: #eeeeee;
  border: 2px solid #dddddd;
  border-radius: 5px;
}

.instructions {
  font-size: 0.8rem;
}
```

```css live-sample___highlights-from-point-example
:root::highlight(highlight1) {
  background-color: rgb(255 255 0 / 0.5);
}

:root::highlight(highlight2) {
  background-color: rgb(255 0 0 / 0.5);
}

:root::highlight(highlight3) {
  background-color: rgb(0 0 255 / 0.75);
  color: white;
}
```

#### JavaScript

Script cho ví dụ này có hai phần chức năng riêng biệt: trước tiên cần tạo các highlight tùy chỉnh và áp dụng chúng vào nội dung, sau đó dùng phương thức `highlightsFromPoint()` để trả về highlight tùy chỉnh từ một điểm cụ thể.

##### Tạo và áp dụng highlight tùy chỉnh

Để tạo highlight tùy chỉnh, chúng ta bắt đầu bằng cách lấy tham chiếu đến phần tử `<p>` và node văn bản bên trong nó. Sau đó tạo biến `highlightCount`, ban đầu bằng `1`, dùng để chỉ định highlight tùy chỉnh nào sẽ áp dụng sau này.

```js live-sample___highlights-from-point-example
const pElem = document.querySelector(".highlightable-text");
const textNode = pElem.firstChild;
let highlightCount = 1;
```

Tiếp theo, chúng ta định nghĩa hàm xử lý sự kiện [`keydown`](/en-US/docs/Web/API/Element/keydown_event) để áp dụng highlight tùy chỉnh lên văn bản được chọn khi nhấn <kbd>h</kbd>. Bên trong, chúng ta lấy văn bản đã chọn bằng {{domxref("Window.getSelection()")}} và chuyển đổi thành {{domxref("Range")}} bằng {{domxref("Selection.getRangeAt()")}}.

Chúng ta kiểm tra xem [`startContainer`](/en-US/docs/Web/API/AbstractRange/startContainer) và [`endContainer`](/en-US/docs/Web/API/AbstractRange/endContainer) của đối tượng `selectedRange` đều bằng `textNode` của đoạn văn hay không, để đảm bảo không cho phép highlight nằm trải qua nhiều container. Nếu đúng, chúng ta đặt `highlightName` tùy chỉnh muốn áp dụng cho `selectedRange` bằng `highlight${highlightCount++}`. Vì `highlightCount` được tăng dần, chúng ta thêm kiểm tra: khi đạt `4`, đặt lại về `1`. Điều này tạo ra hiệu ứng xoay vòng qua các highlight có sẵn theo thứ tự.

Cuối cùng, trong hàm xử lý sự kiện `keydown`, chúng ta tạo đối tượng `highlight` mới bằng hàm khởi tạo {{domxref("Highlight.Highlight", "Highlight()")}}, truyền vào `selectedRange` đã tạo. Sau đó áp dụng highlight tùy chỉnh được tham chiếu trong `highlightName` cho `highlight` bằng phương thức {{domxref("HighlightRegistry.set()")}}.

```js live-sample___highlights-from-point-example
window.addEventListener("keydown", (event) => {
  if (event.key === "h") {
    const selection = window.getSelection();
    const selectedRange = selection.getRangeAt(0);
    if (
      selectedRange.startContainer === textNode &&
      selectedRange.endContainer === textNode
    ) {
      const highlightName = `highlight${highlightCount++}`;
      if (highlightCount === 4) {
        highlightCount = 1;
      }
      const highlight = new Highlight(selectedRange);
      CSS.highlights.set(highlightName, highlight);
    }
  }
});
```

##### Trả về highlight tùy chỉnh từ một điểm

Sau khi có thể tạo và áp dụng highlight tùy chỉnh, chúng ta dùng phương thức `highlightsFromPoint()` để trả về các highlight tùy chỉnh được áp dụng tại một điểm cụ thể.

Chúng ta lấy tham chiếu đến phần tử `<section>`, rồi định nghĩa hàm xử lý sự kiện [`dblclick`](/en-US/docs/Web/API/Element/dblclick_event) để xử lý việc xuất văn bản được làm nổi bật tại vị trí con trỏ chuột khi sự kiện xảy ra. Bên trong hàm xử lý, chúng ta truyền tọa độ chuột hiện tại vào lời gọi `highlightsFromPoint()`, xóa nội dung phần tử `<section>`, rồi duyệt qua từng highlight trong mảng `highlights`.

Với mỗi `highlight`, chúng ta lấy range đầu tiên trong mảng [`ranges`](#ranges) (mỗi highlight chỉ có một range trong trường hợp này), sau đó lấy chuỗi đã được làm nổi bật bằng {{domxref("Range.toString()")}} và thêm vào `innerHTML` của phần tử `<section>`, bên trong một phần tử `<article>`.

```js live-sample___highlights-from-point-example
const section = document.querySelector("section");

pElem.addEventListener("dblclick", (event) => {
  const highlights = CSS.highlights.highlightsFromPoint(
    event.clientX,
    event.clientY,
  );

  section.innerHTML = "";
  for (highlight of highlights) {
    const range = highlight.ranges[0];
    const textSelection = range.toString();
    section.innerHTML += `<article>${textSelection}</article>`;
  }
});
```

#### Kết quả

{{EmbedLiveSample("highlights-from-point-example", "100%", "600")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("css_custom_highlight_api", "The CSS Custom Highlight API", "", "nocode")}}
- [CSS custom highlight API](/en-US/docs/Web/CSS/Guides/Custom_highlight_API) module
