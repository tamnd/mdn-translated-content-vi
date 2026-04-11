---
title: "Navigator: phương thức deprecatedReplaceInURN()"
short-title: deprecatedReplaceInURN()
slug: Web/API/Navigator/deprecatedReplaceInURN
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Navigator.deprecatedReplaceInURN
---

{{APIRef("Fenced Frame API")}}{{seecompattable}}

Phương thức **`deprecatedReplaceInURN()`** của giao diện {{domxref("Navigator")}} thay thế các chuỗi được chỉ định bên trong URL được ánh xạ tương ứng với thuộc tính `url` nội bộ của URN mờ hoặc `FencedFrameConfig` đã cho.

`FencedFrameConfig` hoặc URN mờ được trả về từ một nguồn chẳng hạn như phương thức [Protected Audience API](https://privacysandbox.google.com/private-advertising/protected-audience) `runAdAuction()`, sau đó được đặt làm giá trị của {{domxref("HTMLFencedFrameElement.config")}}. URL nội dung được liên kết với `FencedFrameConfig` hoặc URN mờ được trình duyệt ánh xạ nội bộ tới URL đó và không thể truy cập được qua JavaScript.

Tuy nhiên, bạn có thể muốn thay thế các phần của URL nội bộ đó. Đây là phương pháp phổ biến để chuyển dữ liệu thời gian chạy vào quảng cáo để sử dụng trong quá trình hiển thị. `deprecatedReplaceInURN()` đã được cung cấp dưới dạng biện pháp tạm thời để cho phép thay thế các URL khung có rào chắn, giúp các nhà cung cấp công nghệ quảng cáo di chuyển các hoạt động triển khai hiện có sang API [privacy sandbox](https://privacysandbox.google.com/).

## Cú pháp

```js-nolint
deprecatedReplaceInURN(UrnOrConfig, replacements)
```

### Thông số

- `UrnOrConfig`
  - : Đối tượng `FencedFrameConfig` hoặc URN mờ mà bạn muốn thay thế các phần của URL nội bộ tương ứng.
- `replacements`
  - : Một đối tượng chứa một hoặc nhiều thuộc tính đại diện cho sự thay thế mà bạn muốn thực hiện trong URL nội bộ. Mỗi khóa thuộc tính là một tiểu mục URL mà bạn muốn thay thế và mỗi giá trị thuộc tính là chuỗi để thay thế nó. Lưu ý rằng:
    - Các tiểu mục URL cần thay thế phải có một trong các định dạng sau:
      - `${string}`
      - `%%string%%`
    - Nếu một tiểu mục URL đúng định dạng nhưng không tìm thấy tiểu mục đó trong URL thì lời hứa được trả về vẫn được thực hiện nhưng không có sự thay thế nào được thực hiện.

### Giá trị trả về

{{jsxref("Promise")}} đáp ứng {{jsxref("undefined")}}.

### Ngoại lệ

- `TypeError` {{domxref("DOMException")}}
  - : Ném nếu:
    - `UrnOrConfig` không phải là đối tượng `FencedFrameConfig` hợp lệ hoặc URN mờ.
    - Bất kỳ khóa thay thế nào được chỉ định không phù hợp với định dạng được phép.

## Ví dụ

Lệnh gọi sau có thể được sử dụng để trả về URN mờ:

```js
const exampleURN = await navigator.runAdAuction({
  ...auctionConfig,
  resolveToConfig: false,
});
```

Sau đó, bạn có thể thay thế các phần phụ URL bằng lệnh gọi `deprecatedReplaceInURN()` như sau:

```js
await navigator.deprecatedReplaceInURN(exampleURN, {
  "${foo}": "1",
  "${bar}": "2",
  "%%baz%%": "3",
});
```

Nếu URL nội bộ được liên kết với URN ban đầu là:

```http
https://example.com/a=${foo}&b=${bar}&c=%%baz%%
```

Sau khi thay thế nó sẽ trở thành:

```http
https://example.com/a=1&b=2&c=3
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Fenced Frame API](/en-US/docs/Web/API/Fenced_frame_API)
