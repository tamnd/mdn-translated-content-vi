---
title: "MediaError: thuộc tính code"
short-title: code
slug: Web/API/MediaError/code
page-type: web-api-instance-property
browser-compat: api.MediaError.code
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`MediaError.code`** trả về giá trị số đại diện cho loại lỗi xảy ra trên phần tử phương tiện. Để lấy chuỗi văn bản với thông tin chẩn đoán cụ thể, hãy xem {{domxref("MediaError.message")}}.

## Giá trị

Giá trị số cho biết loại lỗi chung đã xảy ra. Các giá trị có thể được mô tả bên dưới, trong [Hằng số mã lỗi phương tiện](#media_error_code_constants).

### Hằng số mã lỗi phương tiện

<table class="no-markdown">
  <thead>
    <tr>
      <th scope="col">Tên</th>
      <th scope="col">Giá trị</th>
      <th scope="col">Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>MEDIA_ERR_ABORTED</code></td>
      <td><code>1</code></td>
      <td>
        Quá trình tải tài nguyên liên quan đã bị hủy bởi yêu cầu của người dùng.
      </td>
    </tr>
    <tr>
      <td><code>MEDIA_ERR_NETWORK</code></td>
      <td><code>2</code></td>
      <td>
        Một loại lỗi mạng nào đó đã ngăn phương tiện được tải thành công, mặc dù trước đó đã có sẵn.
      </td>
    </tr>
    <tr>
      <td><code>MEDIA_ERR_DECODE</code></td>
      <td><code>3</code></td>
      <td>
        Mặc dù trước đó đã được xác định là có thể sử dụng, nhưng đã xảy ra lỗi trong khi cố giải mã tài nguyên phương tiện, dẫn đến lỗi.
      </td>
    </tr>
    <tr>
      <td><code>MEDIA_ERR_SRC_NOT_SUPPORTED</code></td>
      <td><code>4</code></td>
      <td>
        Tài nguyên liên quan hoặc đối tượng nhà cung cấp phương tiện (chẳng hạn như {{domxref("MediaStream")}}) đã được xác định là không phù hợp.
      </td>
    </tr>
  </tbody>
</table>

## Ví dụ

Ví dụ này tạo phần tử {{HTMLElement("video")}}, thiết lập trình xử lý lỗi cho nó, sau đó đặt thuộc tính [`src`](/en-US/docs/Web/HTML/Reference/Elements/video#src) của phần tử thành tài nguyên video cần trình bày trong phần tử. Trình xử lý lỗi xuất một thông báo.

```js
const obj = document.createElement("video");
obj.onerror = () => {
  console.error(`Error with media: ${obj.error.code}`);
};
obj.src = "https://example.com/blahblah.mp4";
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaError")}}: Giao diện được sử dụng để định nghĩa thuộc tính `MediaError.code`
