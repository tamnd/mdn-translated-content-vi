---
title: "Document: phương thức caretPositionFromPoint()"
short-title: caretPositionFromPoint()
slug: Web/API/Document/caretPositionFromPoint
page-type: web-api-instance-method
browser-compat: api.Document.caretPositionFromPoint
---

{{APIRef("CSSOM view API")}}

Phương thức **`caretPositionFromPoint()`** của giao diện {{domxref("Document")}} trả về một đối tượng {{domxref('CaretPosition')}}, chứa nút DOM, cùng với vị trí caret và offset ký tự của caret trong nút đó.

## Cú pháp

```js-nolint
caretPositionFromPoint(x, y)
caretPositionFromPoint(x, y, options)
```

### Tham số

- `x`
  - : Tọa độ ngang của một điểm.
- `y`
  - : Tọa độ dọc của một điểm.
- `options` {{optional_inline}}
  - : Các thuộc tính tùy chọn sau cũng có thể được chỉ định.
    - `shadowRoots` {{optional_inline}}
      - : Một mảng các đối tượng {{domxref("ShadowRoot")}}.
        Phương thức có thể trả về vị trí caret cho một nút được định nghĩa trong shadow DOM của một shadow root được cung cấp.
        Nếu vị trí caret nằm trong một shadow root không được cung cấp, `CaretPosition` trả về sẽ được ánh xạ lại đến nút là host của shadow root.

### Giá trị trả về

Một đối tượng {{domxref('CaretPosition')}} hoặc `null`.

Giá trị trả về là `null` nếu không có viewport nào được liên kết với tài liệu, nếu `x` hoặc `y` là số âm hoặc nằm ngoài vùng viewport, hoặc nếu tọa độ chỉ đến một điểm mà không thể chèn con trỏ chèn văn bản.

## Ví dụ

### Tách các nút văn bản tại vị trí caret trong DOM

Ví dụ này minh họa cách lấy vị trí caret từ một nút DOM đã chọn, sử dụng vị trí để tách nút và chèn dấu ngắt dòng giữa hai nút. Ví dụ sử dụng `caretPositionFromPoint()` để lấy vị trí caret nếu được hỗ trợ, với phương thức không chuẩn {{domxref("Document.caretRangeFromPoint()")}} làm dự phòng.

Lưu ý rằng một số phần của mã được ẩn, bao gồm mã dùng để ghi log, vì điều này không hữu ích để hiểu phương thức này.

#### HTML

HTML định nghĩa một đoạn văn bản.

```html hidden
<div id="message">
  Trình duyệt này không hỗ trợ cả document.caretRangeFromPoint lẫn
  document.caretPositionFromPoint
</div>
```

```html hidden
<button id="reset" type="button">Đặt lại</button>
```

```html
<p>
  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
  eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam
  voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita
  kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
</p>
```

```html hidden
<pre id="log">Log</pre>
```

```css hidden
#log {
  height: 30px;
  padding: 0.5rem;
  border: 1px solid black;
}
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = text;
}

const reload = document.querySelector("#reset");

reload.addEventListener("click", () => {
  window.location.reload(true);
});
```

```css hidden
#message {
  color: red;
  font-weight: bold;
}

#message.fallback {
  color: darkorange;
}

#message.supported {
  color: green;
}
```

#### JavaScript

Phương thức dưới đây trước tiên kiểm tra hỗ trợ `document.caretPositionFromPoint` và sử dụng nó để lấy nút văn bản và offset tại vị trí caret.
Nếu trình duyệt không hỗ trợ phương thức đó, mã sau đó kiểm tra {{domxref("Document.caretRangeFromPoint", "document.caretRangeFromPoint")}}, và sử dụng phương thức đó thay thế.

Nếu nút tại vị trí caret là một nút văn bản, mã sẽ [tách nút](/en-US/docs/Web/API/Text/splitText) thành hai tại offset đã chọn, và chèn dấu ngắt dòng giữa hai nút.

```js
function insertBreakAtPoint(e) {
  let range;
  let textNode;
  let offset;

  if (document.caretPositionFromPoint) {
    range = document.caretPositionFromPoint(e.clientX, e.clientY);
    textNode = range.offsetNode;
    offset = range.offset;
  } else if (document.caretRangeFromPoint) {
    // Sử dụng phương thức dự phòng riêng của WebKit
    range = document.caretRangeFromPoint(e.clientX, e.clientY);
    textNode = range.startContainer;
    offset = range.startOffset;
  } else {
    // Không phương thức nào được hỗ trợ, không làm gì cả
    return;
  }

  // Mã ghi log (sử dụng phương thức ẩn để lấy chuỗi con với ^ tại offset)
  if (textNode?.nodeType === 3) {
    const caretInText = getSubstringAroundOffset(textNode.textContent, offset);
    log(
      `node: ${textNode.nodeName}, offset: ${offset}, insert: ${caretInText}`,
    );
  }

  // Chỉ tách các TEXT_NODE
  if (textNode?.nodeType === 3) {
    let replacement = textNode.splitText(offset);
    let br = document.createElement("br");
    textNode.parentNode.insertBefore(br, replacement);
  }
}
```

Phương thức được thêm vào làm trình xử lý sự kiện click cho bất kỳ phần tử đoạn văn nào.

```js
const paragraphs = document.getElementsByTagName("p");
for (const paragraph of paragraphs) {
  paragraph.addEventListener("click", insertBreakAtPoint);
}
```

```js hidden
// Chèn ^ tại offset và lấy chuỗi con cho log
function getSubstringAroundOffset(text, offset, length = 10) {
  const start = Math.max(0, offset - length);
  const end = Math.min(text.length, offset + length + 1);
  // Chèn ký tự caret tại offset
  const modifiedText = `${text.substring(0, offset)}^${text.substring(offset)}`;
  return `...${modifiedText.substring(start, end)}...`;
}
```

```js hidden
let message = document.getElementById("message");
if (document.caretPositionFromPoint) {
  message.textContent =
    "Trình duyệt này hỗ trợ document.caretPositionFromPoint chuẩn";
  message.classList.add("supported");
} else if (document.caretRangeFromPoint) {
  message.textContent =
    "Trình duyệt này hỗ trợ document.caretRangeFromPoint không chuẩn";
  message.classList.add("supported");
}
```

#### Kết quả

Nhấp vào bất kỳ đâu trong đoạn văn **Lorem ipsum ...** bên dưới để chèn dấu ngắt dòng tại điểm bạn nhấp.
Lưu ý rằng log hiển thị `nodeName`, offset và một đoạn của nút đã chọn với ký tự `^` tại offset.

{{EmbedLiveSample('Split text nodes at caret position in DOM','100%','400px')}}

### Tách các nút văn bản tại vị trí caret trong Shadow DOM

Ví dụ này minh họa cách lấy vị trí caret từ một nút đã chọn trong shadow root.
Ví dụ rất giống với ví dụ DOM ở trên, ngoại trừ một số văn bản nằm trong shadow root.
Chúng ta cung cấp một nút để cho phép bạn xem sự khác biệt khi một shadow root được truyền/không truyền vào `caretPositionFromPoint()`.

Lưu ý rằng một số phần của mã được ẩn, bao gồm mã dùng để ghi log, vì điều này không hữu ích để hiểu phương thức này.

#### HTML

HTML định nghĩa một đoạn văn bản bên trong phần tử {{htmlelement("div")}}.
Đoạn văn chứa một phần tử {{htmlelement("span")}} với `id` là "host" mà chúng ta sẽ sử dụng làm host cho một shadow root.
Ngoài ra còn có một số nút mà chúng ta sẽ sử dụng để đặt lại ví dụ, và để Thêm/Xóa đối số tùy chọn shadow root cho `caretPositionFromPoint()`.

```html hidden
<div id="message">
  Trình duyệt này không hỗ trợ cả document.caretRangeFromPoint lẫn
  document.caretPositionFromPoint
</div>
```

```html
<button id="reset" type="button">Đặt lại</button>
<button id="shadowButton" type="button">Thêm Shadow</button>
<div>
  <p>
    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
    eirmod tempor invidunt ut <span id="host"></span> labore et dolore magna
    aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo
    dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est
    Lorem ipsum dolor sit amet.
  </p>
</div>
```

```html hidden
<pre id="log">Log</pre>
```

#### CSS

Ở đây chúng ta sử dụng CSS để làm cho phần tử `#host` có màu đỏ và in đậm.
Điều này giúp dễ dàng phân biệt giữa văn bản trong DOM và văn bản trong shadow DOM.

```css
#host {
  color: red;
  font-weight: bold;
}
```

```css hidden
#log {
  height: 30px;
  padding: 0.5rem;
  border: 1px solid black;
}
```

```css hidden
#message {
  color: red;
  font-weight: bold;
}

#message.fallback {
  color: darkorange;
}

#message.supported {
  color: green;
}
```

#### JavaScript

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = text;
}

const reload = document.querySelector("#reset");

reload.addEventListener("click", () => {
  window.location.reload(true);
});
```

Đầu tiên chúng ta có một số mã để populate shadow DOM.
Chúng ta sử dụng JavaScript để đính kèm shadow root một cách động, vì hệ thống ví dụ của MDN không cho phép chúng ta làm điều này một cách khai báo bằng phần tử {{htmlelement("template")}}.
Nội dung của shadow DOM là một phần tử {{htmlelement("span")}} chứa văn bản "I'm in the shadow DOM".

```js
const host = document.querySelector("#host");
const shadow = host.attachShadow({ mode: "open" });
const shadowSpan = document.createElement("span");
shadowSpan.textContent = "I'm in the shadow DOM";
shadow.appendChild(shadowSpan);
```

Tiếp theo chúng ta thêm trình xử lý cho nút "Bật/Tắt shadow" của chúng ta.
Mã này chuyển đổi giá trị của biến `useShadows` và cập nhật văn bản nút cho phù hợp.

```js
let useShadows = false;

const shadowButton = document.querySelector("#shadowButton");
shadowButton.addEventListener("click", () => {
  useShadows = !useShadows;
  shadowButton.innerText = useShadows ? "Xóa Shadow" : "Thêm Shadow";
});
```

Phương thức dưới đây trước tiên kiểm tra hỗ trợ `document.caretPositionFromPoint` và sử dụng nó để lấy nút văn bản và offset tại vị trí caret.
Giá trị của biến `useShadows` được sử dụng để xác định xem shadow root được lưu trữ trong văn bản của chúng ta có được truyền vào `caretPositionFromPoint()` hay không.

- Nếu trình duyệt không hỗ trợ phương thức đó, mã sau đó kiểm tra {{domxref("Document.caretRangeFromPoint", "document.caretRangeFromPoint")}}, và sử dụng phương thức đó thay thế.
- Nếu nút tại vị trí caret là một nút văn bản, mã sẽ tách nút tại offset đã chọn, và chèn dấu ngắt dòng giữa chúng.
- Nếu nút là một nút phần tử, thì mã chèn một nút phần tử ngắt dòng tại offset.

```js
function insertBreakAtPoint(e) {
  let range;
  let textNode;
  let offset;

  if (document.caretPositionFromPoint) {
    range = document.caretPositionFromPoint(
      e.clientX,
      e.clientY,
      useShadows ? { shadowRoots: [shadow] } : null,
    );
    textNode = range.offsetNode;
    offset = range.offset;
  } else if (document.caretRangeFromPoint) {
    // Sử dụng phương thức dự phòng riêng của WebKit
    range = document.caretRangeFromPoint(e.clientX, e.clientY);
    textNode = range.startContainer;
    offset = range.startOffset;
  } else {
    // Không phương thức nào được hỗ trợ, không làm gì cả
    return;
  }

  // Mã ghi log (sử dụng phương thức ẩn để lấy chuỗi con với ^ tại offset)
  if (textNode) {
    if (textNode.nodeType === 3) {
      const caretInText = getSubstringAroundOffset(
        textNode.textContent,
        offset,
      );
      log(
        `type: TEXT_NODE, name: ${textNode.nodeName}, offset: ${offset}:
${caretInText}`,
      );
    } else if (textNode.nodeType === 1) {
      log(`type: ELEMENT_NODE, name: ${textNode.nodeName}, offset: ${offset}`);
    } else {
      log(
        `type: ${textNode.nodeType}, name: ${textNode.nodeName}, offset: ${offset}`,
      );
    }
  }

  // Chèn dòng tại caret
  if (textNode?.nodeType === 3) {
    // TEXT_NODE - tách văn bản tại offset và thêm br
    let replacement = textNode.splitText(offset);
    let br = document.createElement("br");
    textNode.parentNode.insertBefore(br, replacement);
  } else if (textNode?.nodeType === 1) {
    // ELEMENT_NODE - Thêm nút br tại nút offset
    let br = document.createElement("br");
    const targetNode = textNode.childNodes[offset];
    textNode.insertBefore(br, targetNode);
  } else {
    // Không làm gì cả
  }
}
```

Cuối cùng chúng ta thêm hai trình xử lý sự kiện click cho các phần tử đoạn văn trong DOM và trong shadow root, tương ứng.
Lưu ý rằng chúng ta cần truy vấn cụ thể các phần tử trong `shadowRoot` vì chúng không hiển thị với các phương thức truy vấn DOM thông thường.

```js
// Trình xử lý sự kiện click cho các phần tử <p> trong DOM
const paragraphs = document.getElementsByTagName("p");
for (const paragraph of paragraphs) {
  paragraph.addEventListener("click", insertBreakAtPoint);
}

// Trình xử lý sự kiện click cho các phần tử <p> trong Shadow DOM
const shadowParagraphs = host.shadowRoot.querySelectorAll("p");
for (const paragraph of shadowParagraphs) {
  console.log(paragraph);
  paragraph.addEventListener("click", insertBreakAtPoint);
}
```

```js hidden
// Chèn ^ tại offset và lấy chuỗi con cho log
function getSubstringAroundOffset(text, offset, length = 10) {
  const start = Math.max(0, offset - length);
  const end = Math.min(text.length, offset + length + 1);
  // Chèn ký tự caret tại offset
  const modifiedText = `${text.substring(0, offset)}^${text.substring(offset)}`;
  return `...${modifiedText.substring(start, end)}...`;
}
```

```js hidden
let message = document.getElementById("message");
if (document.caretPositionFromPoint) {
  message.textContent =
    "Trình duyệt này hỗ trợ document.caretPositionFromPoint chuẩn";
  message.classList.add("supported");
} else if (document.caretRangeFromPoint) {
  message.textContent =
    "Trình duyệt này hỗ trợ document.caretRangeFromPoint không chuẩn";
  message.classList.add("supported");
}
```

#### Kết quả

Nhấp vào đoạn văn **Lorem ipsum ...** trước hoặc sau văn bản shadow DOM để chèn dấu ngắt dòng tại điểm bạn nhấp.
Lưu ý rằng trong trường hợp này log cho biết bạn đã chọn một `TEXT_NODE`, offset và một đoạn của nút đã chọn với ký tự `^` tại offset.

Ban đầu shadow root không được truyền vào `caretPositionFromPoint()`, vì vậy nếu bạn nhấp vào văn bản "I'm in the shadow DOM", nút vị trí caret trả về là nút cha của host, tại offset của shadow root.
Do đó dấu ngắt dòng được thêm vào trước nút thay vì điểm bạn đã chọn.
Lưu ý rằng nút vị trí caret trong trường hợp này có kiểu `ELEMENT_NODE`.

Nếu bạn nhấp vào nút "Thêm shadow", shadow root được truyền vào `caretPositionFromPoint()`, do đó vị trí caret trả về là nút đã chọn cụ thể trong shadow DOM.
Điều này làm cho văn bản shadow DOM hoạt động giống như văn bản đoạn văn khác.

{{EmbedLiveSample('Split text nodes at caret positions in a Shadow DOM','100%','400px')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref('CaretPosition')}}
