---
title: "HTMLMediaElement: thuộc tính networkState"
short-title: networkState
slug: Web/API/HTMLMediaElement/networkState
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.networkState
---

{{APIRef("HTML DOM")}}

các
Thuộc tính **`HTMLMediaElement.networkState`** biểu thị
trạng thái hiện tại của việc tìm nạp phương tiện qua mạng.

## Giá trị

Một `unsigned short`. Các giá trị có thể là:

| Hằng số             | Giá trị | Mô tả                                                                                |
| ------------------- | ------- | ------------------------------------------------------------------------------------ |
| `NETWORK_EMPTY`     | 0       | Chưa có dữ liệu. Ngoài ra, `readyState` là `HAVE_NOTHING`.                           |
| `NETWORK_IDLE`      | 1       | HTMLMediaElement đang hoạt động và đã chọn tài nguyên nhưng hiện không sử dụng mạng. |
| `NETWORK_LOADING`   | 2       | Trình duyệt đang tải xuống dữ liệu HTMLMediaElement.                                 |
| `NETWORK_NO_SOURCE` | 3       | Không tìm thấy src HTMLMediaElement.                                                 |

## Ví dụ

Ví dụ này sẽ lắng nghe phần tử âm thanh bắt đầu phát và sau đó kiểm tra xem nó có
vẫn đang tải dữ liệu.

```html
<audio id="example" preload="auto">
  <source src="sound.ogg" type="audio/ogg" />
</audio>
```

```js
const obj = document.getElementById("example");

obj.addEventListener("playing", () => {
  if (obj.networkState === 2) {
    // Still loading…
  }
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement")}}: Giao diện dùng để định nghĩa thuộc tính `HTMLMediaElement.networkState`
