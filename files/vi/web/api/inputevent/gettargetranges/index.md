---
title: "InputEvent: phương thức getTargetRanges()"
short-title: getTargetRanges()
slug: Web/API/InputEvent/getTargetRanges
page-type: web-api-instance-method
browser-compat: api.InputEvent.getTargetRanges
---

{{APIRef("UI Events")}}

Phương thức **`getTargetRanges()`** của giao diện {{domxref("InputEvent")}} trả về một mảng các đối tượng {{domxref("StaticRange")}} sẽ bị ảnh hưởng bởi một thay đổi đối với DOM nếu sự kiện đầu vào không bị hủy.

Điều này cho phép các ứng dụng web ghi đè hành vi chỉnh sửa văn bản trước khi trình duyệt sửa đổi cây DOM, và cung cấp khả năng kiểm soát nhiều hơn đối với các sự kiện đầu vào để cải thiện hiệu suất.

Tùy thuộc vào giá trị của `inputType` và máy chủ chỉnh sửa hiện tại, giá trị trả về dự kiến của phương thức này thay đổi:

<table>
  <thead>
    <tr>
      <th>inputType</th>
      <th>Máy chủ chỉnh sửa</th>
      <th>Phản hồi của <code>getTargetRanges()</code></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>"historyUndo"</code> hoặc <code>"historyRedo"</code></td>
      <td>Bất kỳ</td>
      <td>Mảng rỗng</td>
    </tr>
    <tr>
      <td>Tất cả các loại còn lại</td>
      <td><code>contenteditable</code></td>
      <td>
        một mảng các đối tượng
        {{domxref("StaticRange")}}
        được liên kết với sự kiện
      </td>
    </tr>
    <tr>
      <td>Tất cả các loại còn lại</td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input"><code>input</code></a>
        hoặc <a href="/en-US/docs/Web/HTML/Reference/Elements/textarea"><code>textarea</code></a>
      </td>
      <td>
        một mảng rỗng
      </td>
    </tr>
  </tbody>
</table>

## Cú pháp

```js-nolint
getTargetRanges()
```

### Tham số

Không có.

### Giá trị trả về

Một mảng các đối tượng {{domxref("StaticRange")}}.

## Ví dụ

### Phát hiện tính năng

Hàm sau trả về true nếu `beforeinput`, và do đó `getTargetRanges`, được hỗ trợ.

```js
function isBeforeInputEventAvailable() {
  return (
    window.InputEvent &&
    typeof InputEvent.prototype.getTargetRanges === "function"
  );
}
```

### Sử dụng cơ bản

Ví dụ sau chọn một phần tử `contenteditable` và sử dụng sự kiện [`beforeinput`](/en-US/docs/Web/API/Element/beforeinput_event) để ghi nhật ký kết quả của `getTargetRanges()`.

```js
const editableElem = document.querySelector('[contenteditable="true"]');

editableElem.addEventListener("beforeinput", (e) => {
  const targetRanges = e.getTargetRanges();
  console.log(targetRanges);
});
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
