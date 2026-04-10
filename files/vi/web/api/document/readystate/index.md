---
title: "Document: thuộc tính readyState"
short-title: readyState
slug: Web/API/Document/readyState
page-type: web-api-instance-property
browser-compat: api.Document.readyState
---

{{APIRef("DOM")}}

Thuộc tính **`Document.readyState`** mô tả trạng thái tải của {{domxref("document")}}. Khi giá trị của thuộc tính này thay đổi, sự kiện {{domxref("Document/readystatechange_event", "readystatechange")}} được kích hoạt trên đối tượng {{domxref("document")}}.

## Giá trị

`readyState` của một tài liệu có thể là một trong các giá trị sau:

- `loading`
  - : {{domxref("document")}} vẫn đang tải (tức là HTML parser vẫn đang hoạt động).
- `interactive`
  - : Tài liệu đã được phân tích cú pháp nhưng các tài nguyên con như các tập lệnh {{domxref("HTMLScriptElement/defer", "deferred", "", "nocode")}} và [module](/en-US/docs/Web/JavaScript/Guide/Modules), hình ảnh, stylesheet và frame vẫn đang tải. Khi ở trạng thái này, và các tập lệnh defer và module đã được thực thi, sự kiện {{domxref("Document/DOMContentLoaded_event", "DOMContentLoaded")}} được kích hoạt.
- `complete`
  - : Tài liệu và tất cả tài nguyên con đã tải xong. Trạng thái này cho biết sự kiện {{domxref("Window/load_event", "load")}} sắp được kích hoạt.

## Ví dụ

### Các trạng thái sẵn sàng khác nhau

```js
switch (document.readyState) {
  case "loading":
    // Tài liệu đang tải.
    break;
  case "interactive": {
    // Tài liệu đã tải xong và chúng ta có thể truy cập các phần tử DOM.
    // Các tài nguyên con như tập lệnh, hình ảnh, stylesheet và frame vẫn đang tải.
    const span = document.createElement("span");
    span.textContent = "Phần tử <span>.";
    document.body.appendChild(span);
    break;
  }
  case "complete":
    // Trang đã tải đầy đủ.
    console.log(
      `Quy tắc CSS đầu tiên là: ${document.styleSheets[0].cssRules[0].cssText}`,
    );
    break;
}
```

### readystatechange như một phương án thay thế cho sự kiện DOMContentLoaded

```js
// Phương án thay thế cho sự kiện DOMContentLoaded
document.onreadystatechange = () => {
  if (document.readyState === "interactive") {
    initApplication();
  }
};
```

### readystatechange như một phương án thay thế cho sự kiện load

```js
// Phương án thay thế cho sự kiện load
document.onreadystatechange = () => {
  if (document.readyState === "complete") {
    initApplication();
  }
};
```

### readystatechange như trình lắng nghe sự kiện để chèn hoặc sửa đổi DOM trước DOMContentLoaded

```js
document.addEventListener("readystatechange", (event) => {
  if (event.target.readyState === "interactive") {
    initLoader();
  } else if (event.target.readyState === "complete") {
    initApp();
  }
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện liên quan:
  - {{domxref("Document/readystatechange_event", "readystatechange")}}
  - {{domxref("Document/DOMContentLoaded_event", "DOMContentLoaded")}}
  - {{domxref("Window/load_event", "load")}}
