---
title: "Selection: phương thức getComposedRanges()"
short-title: getComposedRanges()
slug: Web/API/Selection/getComposedRanges
page-type: web-api-instance-method
browser-compat: api.Selection.getComposedRanges
---

{{ ApiRef("DOM") }}

Phương thức **`Selection.getComposedRanges()`** trả về một mảng các đối tượng {{domxref("StaticRange")}} đại diện cho các range hiện tại của vùng chọn, và có thể trả về các range cắt qua ranh giới shadow.

Vì các điểm đầu/cuối của range có thể nằm trong một shadow tree, hoặc thậm chí ở các shadow tree khác nhau, và vì các shadow tree này có thể là đóng, nên mặc định phương thức không thể trả về các nút bên trong shadow tree.
Nếu phương thức cần trả về một vùng chọn bao gồm các nút bên trong shadow tree, thì các đối tượng {{domxref("ShadowRoot")}} của các cây đó phải được truyền làm đối số cho phương thức.
Nếu không cung cấp root tương ứng và điểm bắt đầu hoặc điểm kết thúc của vùng chọn nằm trong một shadow tree, range trả về sẽ được tái phạm vi để bao gồm host của shadow root thay vì một nút nào đó bên trong root.

Các range được trả về đại diện cho range tại thời điểm `getComposedRanges()` được gọi.
Nếu DOM hoặc shadow DOM bị biến đổi, range được chọn có thể không còn chính xác.
Mã ứng dụng có thể dùng {{domxref("MutationObserver")}} để theo dõi các biến đổi DOM rồi gọi {{domxref("Selection.setBaseAndExtent()")}} để cập nhật vùng chọn.

> [!NOTE]
> Nên dùng phương thức này thay vì {{domxref("Selection.getRangeAt()")}} khi chọn các range có thể cắt qua ranh giới shadow root.
> {{domxref("Selection.getRangeAt()")}} không nhận biết shadow root.
> Range trả về không được chỉ định rõ và khác nhau giữa các trình duyệt.

## Cú pháp

```js-nolint
getComposedRanges()
getComposedRanges(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng với các thuộc tính sau, tất cả đều là tùy chọn:
    - `shadowRoots` {{optional_inline}}
      - : Một mảng các đối tượng {{domxref("ShadowRoot")}}.
        Nếu một điểm cuối của vùng chọn nằm trong một shadow root được cung cấp, range sẽ có thể trả về các nút bên trong cây Shadow DOM tương ứng của nó.
        Nếu không, khi vùng chọn cắt qua một ranh giới shadow và `ShadowRoot` tương ứng không được cung cấp, range trả về sẽ được điều chỉnh để bao gồm toàn bộ phần host của shadow root.

> [!NOTE]
> Trong đặc tả ban đầu, shadow root được chỉ định như một tập hợp [rest parameters](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters). Một số trình duyệt có thể vẫn hỗ trợ cú pháp cũ này.

### Giá trị trả về

Một mảng các đối tượng {{domxref("StaticRange")}} đại diện cho các range đã chọn trong cây (flattened) đã được compose của tài liệu. Tại thời điểm viết bài, đặc tả cho rằng mảng này chỉ chứa một đối tượng.

## Ví dụ

### Chọn qua các inline shadow root

Ví dụ này minh họa cách `getComposedRanges()` hoạt động, cả khi shadow root được truyền vào và khi không, đồng thời so sánh với {{domxref("Selection.getRangeAt()")}}.

Nó cho phép bạn chọn văn bản được định nghĩa ở các nút khác nhau trong DOM, và trong các shadow root mở và đóng, sao chép range cho vùng chọn bằng những cách khác nhau, rồi áp dụng lại range để xem vùng chọn gốc hoạt động tốt đến mức nào.

#### HTML

HTML định nghĩa một số nút văn bản với các phần tử `<span>` mà chúng ta sẽ gắn shadow root bằng JavaScript.
Chúng ta cũng thêm một số nút để sao chép và áp dụng vùng chọn bằng nhiều phương pháp khác nhau.

```html
<p>
  DOM Text One<span id="openHost"></span>DOM Text Two<span
    id="closedHost"></span
  >DOM Text Three
</p>
```

```html
<button id="copySelection">Copy range not passing shadow roots</button>
<button id="copySelectionWithShadowRoots">
  Copy range passing shadow roots
</button>
<button id="applySelection">Apply selection</button>
<hr />
<button id="copySelectionRangeAt">Copy range with getRangeAt()</button>
<button id="applySelectionGetRangeAt">Apply selection</button>
```

#### CSS

CSS không làm gì đặc biệt.
Chúng ta chỉ sắp xếp các nút theo chiều dọc để dễ đọc hơn.

```css
button {
  display: block;
}
```

```css hidden
#log {
  height: 20px;
  padding: 0.5rem;
  border: 1px solid black;
}
```

#### JavaScript

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = text;
}
```

Phần lớn công việc diễn ra trong JavaScript.
Đầu tiên chúng ta ghi log nếu `getComposedRanges()` không được hỗ trợ, dù thực tế chúng ta không chặn phần còn lại của ví dụ khỏi việc cố dùng nó.

```js
if (!("getComposedRanges" in Selection.prototype)) {
  log("getComposedRanges() method not supported in this browser");
}
```

Sau đó chúng ta tạo một open shadow root và một closed shadow root, rồi gắn chúng vào hai phần tử `<span>` đã tạo trong HTML.
Chúng chứa một ít văn bản đậm để chúng ta có thể dễ dàng nhận ra các nút shadow khi HTML được hiển thị.

```js
let openRoot = openHost.attachShadow({ mode: "open" });
openRoot.innerHTML = `<b>Open Shadow DOM Text</b>`;

let closedRoot = closedHost.attachShadow({ mode: "closed" });
closedRoot.innerHTML = `<b>Closed Shadow DOM Text</b>`;
```

Tiếp theo chúng ta tạo mã để lấy các range đã chọn bằng `getComposedRanges()` khi hai nút đầu tiên được bấm.
Nút đầu tiên gọi `getComposedRanges()` mà không truyền shadow root, còn nút thứ hai truyền cả hai shadow root.
Trong cả hai trường hợp, composed range được lưu vào một biến.

```js
const copySelectionButton = document.querySelector("#copySelection");
let composedRangeSelection = null;
copySelectionButton.addEventListener("click", () => {
  composedRangeSelection = window.getSelection().getComposedRanges()[0];
  log(`Selection copied (no shadow roots passed)`);
});

const copySelectionWithShadowRootsButton = document.querySelector(
  "#copySelectionWithShadowRoots",
);
copySelectionWithShadowRootsButton.addEventListener("click", () => {
  composedRangeSelection = window
    .getSelection()
    .getComposedRanges({ shadowRoots: [openRoot, closedRoot] })[0];
  log(`Selection has been copied (shadow roots passed)`);
});
```

Phần xử lý cho nút "Apply selection" được hiển thị dưới đây.
Nó gọi {{domxref("Selection.setBaseAndExtent()", "setBaseAndExtent()")}} để đặt vùng chọn hiện tại, truyền các nút và độ lệch từ range đã lưu.

```js
const applySelectionButton = document.querySelector("#applySelection");
applySelectionButton.addEventListener("click", () => {
  if (composedRangeSelection) {
    window
      .getSelection()
      .setBaseAndExtent(
        composedRangeSelection.startContainer,
        composedRangeSelection.startOffset,
        composedRangeSelection.endContainer,
        composedRangeSelection.endOffset,
      );
    log(`Selection applied`);
  } else {
    log(`No selection to apply`);
  }
});
```

Phần cuối của mã định nghĩa các nút để sao chép range vùng chọn hiện tại bằng {{domxref("Selection.getRangeAt()")}} rồi áp dụng lại vùng chọn đó.

```js
const copySelectionRangeAtButton = document.querySelector(
  "#copySelectionRangeAt",
);
let rangeSelection = null;
copySelectionRangeAtButton.addEventListener("click", () => {
  const selection = window.getSelection();
  if (selection.rangeCount > 0) {
    log(`Selection copied using getRangeAt()`);
    rangeSelection = selection.getRangeAt(0);
  } else {
    log(`No range selected`);
  }
});

const applySelectionGetRangeAtButton = document.querySelector(
  "#applySelectionGetRangeAt",
);
applySelectionGetRangeAtButton.addEventListener("click", () => {
  if (rangeSelection) {
    window
      .getSelection()
      .setBaseAndExtent(
        rangeSelection.startContainer,
        rangeSelection.startOffset,
        rangeSelection.endContainer,
        rangeSelection.endOffset,
      );
    log(`Selection applied`);
  } else {
    log(`No selection to apply`);
  }
});
```

```html hidden
<pre id="log"></pre>
```

#### Kết quả

Ví dụ chạy được hiển thị bên dưới.
Chọn văn bản ở dòng trên cùng, bắt đầu từ một đoạn văn bản bình thường và kết thúc ở một phần đậm để bạn đã chọn các nút từ DOM vào một shadow root.
Nếu bạn chọn "Copy range passing shadow roots" rồi bấm nút "Apply selection", bạn sẽ thấy vùng chọn không thay đổi, vì mã đã cho phép truy cập tất cả các nút trong shadow root, kể cả khi nó đóng.
