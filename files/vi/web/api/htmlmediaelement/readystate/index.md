---
title: "HTMLMediaElement: thuộc tính readyState"
short-title: readyState
slug: Web/API/HTMLMediaElement/readyState
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.readyState
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLMediaElement.readyState`** biểu thị
trạng thái sẵn sàng của các phương tiện truyền thông.

## Giá trị

Một số là một trong năm hằng số trạng thái có thể được xác định trên giao diện {{domxref("HTMLMediaElement")}}:

- `HTMLMediaElement.HAVE_NOTHING` (0)
- : Không có thông tin về tài nguyên truyền thông.
- `HTMLMediaElement.HAVE_METADATA` (1)
- : Đã truy xuất đủ tài nguyên phương tiện để khởi tạo các thuộc tính siêu dữ liệu. Tìm kiếm sẽ không còn đưa ra một ngoại lệ nữa.
- `HTMLMediaElement.HAVE_CURRENT_DATA` (2)
- : Dữ liệu có sẵn cho vị trí phát lại hiện tại, nhưng không đủ để thực sự phát nhiều hơn một khung hình.
- `HTMLMediaElement.HAVE_FUTURE_DATA` (3)
- : Có sẵn dữ liệu về vị trí phát lại hiện tại cũng như trong ít nhất một khoảng thời gian ngắn trong tương lai (nói cách khác, ít nhất hai khung hình của video chẳng hạn).
- `HTMLMediaElement.HAVE_ENOUGH_DATA` (4)
- : Có đủ dữ liệu—và tốc độ tải xuống đủ cao—để phương tiện có thể được phát đến hết mà không bị gián đoạn.

## Ví dụ

Ví dụ này sẽ lắng nghe dữ liệu âm thanh được tải cho phần tử `example`. Nó sẽ
sau đó kiểm tra xem ít nhất vị trí phát lại hiện tại đã được tải chưa. Nếu có thì
âm thanh sẽ phát.

```html
<audio id="example" preload="auto">
  <source src="sound.ogg" type="audio/ogg" />
</audio>
```

```js
const obj = document.getElementById("example");

obj.addEventListener("loadeddata", () => {
  if (obj.readyState >= HTMLMediaElement.HAVE_CURRENT_DATA) {
    obj.play();
  }
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement")}}: Giao diện dùng để định nghĩa thuộc tính `HTMLMediaElement.readyState`
