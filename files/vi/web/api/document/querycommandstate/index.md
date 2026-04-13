---
title: "Document: phương thức queryCommandState()"
short-title: queryCommandState()
slug: Web/API/Document/queryCommandState
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.Document.queryCommandState
---

{{ApiRef("DOM")}}{{deprecated_header}}{{Non-standard_header}}

> [!NOTE]
> Mặc dù phương thức {{domxref("Document/execCommand", "execCommand()")}} đã lỗi thời, vẫn có một số trường hợp sử dụng hợp lệ chưa có giải pháp thay thế khả thi, như đã đề cập trong bài viết về `execCommand()`. Trong những trường hợp này, bạn có thể thấy phương thức này hữu ích để triển khai trải nghiệm người dùng hoàn chỉnh, nhưng hãy kiểm tra để đảm bảo tương thích trình duyệt.

Phương thức **`queryCommandState()`** sẽ cho bạn biết nếu vùng chọn hiện tại có một lệnh {{domxref("Document.execCommand()")}} cụ thể được áp dụng.

## Cú pháp

```js-nolint
queryCommandState(command)
```

### Tham số

- `command`
  - : Một lệnh từ {{domxref("Document.execCommand()")}}

### Giá trị trả về

`queryCommandState()` có thể trả về một giá trị boolean hoặc `null` nếu trạng thái không xác định.

## Ví dụ

### HTML

```html
<div contenteditable="true">Select a part of this text!</div>
<button>Kiểm tra trạng thái của lệnh 'bold'</button>
<hr />
<div id="output"></div>
```

```css hidden
hr,
button {
  margin: 1rem 0;
}
```

### JavaScript

```js
function makeBold() {
  const state = document.queryCommandState("bold");
  let message;
  switch (state) {
    case true:
      message = "Định dạng in đậm sẽ bị xóa khỏi văn bản đã chọn.";
      break;
    case false:
      message = "Văn bản đã chọn sẽ được hiển thị in đậm.";
      break;
    default:
      message = "Trạng thái của lệnh 'bold' không thể xác định.";
      break;
  }
  document.querySelector("#output").textContent = `Output: ${message}`;
  document.execCommand("bold");
}

document.querySelector("button").addEventListener("click", makeBold);
```

### Kết quả

{{EmbedLiveSample('Example', '100', '180')}}

## Đặc tả kỹ thuật

Tính năng này không thuộc bất kỳ đặc tả kỹ thuật hiện tại nào. Nó không còn nằm trong lộ trình trở thành tiêu chuẩn. Có một [bản nháp đặc tả W3C execCommand không chính thức](https://w3c.github.io/editing/docs/execCommand/).

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLElement.contentEditable")}}
- {{domxref("document.designMode")}}
- {{domxref("document.execCommand()")}}
- Các lỗi trình duyệt liên quan đến `queryCommandState()`: [Tài liệu "Browser Inconsistencies" của Scribe](https://github.com/guardian/scribe/blob/master/BROWSERINCONSISTENCIES.md#documentquerycommandstate)
