---
title: "Selection: thuộc tính rangeCount"
short-title: rangeCount
slug: Web/API/Selection/rangeCount
page-type: web-api-instance-property
browser-compat: api.Selection.rangeCount
---

{{ ApiRef("DOM") }}

Thuộc tính chỉ đọc **`Selection.rangeCount`** trả về số lượng range trong vùng chọn.

Trước khi người dùng bấm vào một trang mới tải, `rangeCount` là `0`. Sau khi người dùng bấm vào trang, `rangeCount` là `1`, ngay cả khi không có vùng chọn nào hiện lên.

Thông thường người dùng chỉ có thể chọn một range tại một thời điểm, nên `rangeCount` thường là `1`. Có thể dùng script để làm cho vùng chọn chứa nhiều hơn một range.

Các trình duyệt Gecko cho phép nhiều vùng chọn trên các ô bảng. Firefox cho phép chọn nhiều range trong tài liệu bằng Ctrl+click (trừ khi cú nhấp xảy ra bên trong một phần tử có thuộc tính CSS `display: table-cell`).

## Giá trị

Một số.

## Ví dụ

Ví dụ sau sẽ hiển thị `rangeCount` mỗi giây. Hãy chọn văn bản trong trình duyệt để xem nó thay đổi.

### HTML

```html
<table>
  <tbody>
    <tr>
      <td>a.1</td>
      <td>a.2</td>
    </tr>
    <tr>
      <td>b.1</td>
      <td>b.2</td>
    </tr>
    <tr>
      <td>c.1</td>
      <td>c.2</td>
    </tr>
  </tbody>
</table>
```

### JavaScript

```js
setInterval(() => {
  console.log(window.getSelection().rangeCount);
}, 1000);
```

### Kết quả

Mở console của bạn để xem có bao nhiêu range trong vùng chọn. Trong các trình duyệt Gecko, bạn có thể chọn nhiều range trên các ô bảng bằng cách giữ <kbd>Ctrl</kbd> (hoặc <kbd>Cmd</kbd> trên macOS) trong khi kéo chuột.

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Selection")}}, giao diện mà nó thuộc về.
