---
title: "DOMPoint: fromPoint() static method"
short-title: fromPoint()
slug: Web/API/DOMPoint/fromPoint_static
page-type: web-api-static-method
browser-compat: api.DOMPoint.fromPoint_static
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức tĩnh **`fromPoint()`** của giao diện {{domxref("DOMPoint")}} tạo và trả về một đối tượng `DOMPoint` có thể thay đổi mới từ một điểm nguồn cho trước.

Bạn cũng có thể tạo đối tượng `DOMPoint` mới bằng cách sử dụng hàm khởi tạo {{domxref("DOMPoint.DOMPoint", "DOMPoint()")}}.

Mặc dù giao diện này dựa trên `DOMPointReadOnly`, nhưng nó không phải là chỉ đọc; các thuộc tính bên trong có thể được thay đổi tùy ý.

## Cú pháp

```js-nolint
DOMPoint.fromPoint(sourcePoint)
```

### Tham số

- `sourcePoint`
  - : Một phiên bản {{domxref("DOMPoint")}} hoặc {{domxref("DOMPointReadOnly")}}, hoặc một đối tượng chứa các thuộc tính sau, để lấy giá trị cho các thuộc tính của điểm mới:
    - `x`
      - : Giá trị dấu phẩy động không giới hạn biểu thị tọa độ `x` của điểm trong không gian. Đây thường là tọa độ ngang, với giá trị dương ở bên phải và giá trị âm ở bên trái. Giá trị mặc định là `0`.
    - `y`
      - : Số dấu phẩy động không giới hạn biểu thị tọa độ `y` của điểm. Đây là tọa độ dọc, và nếu không có phép biến đổi nào thay đổi hệ trục tọa độ, giá trị dương là hướng xuống và giá trị âm là hướng lên phía trên màn hình. Giá trị mặc định là `0`.
    - `z`
      - : Giá trị dấu phẩy động không giới hạn biểu thị tọa độ `z` của điểm, đây là (giả sử không có phép biến đổi nào thay đổi tình huống) tọa độ độ sâu; giá trị dương gần người dùng hơn và giá trị âm lui về phía sau màn hình. Giá trị mặc định là `0`.
    - `w`
      - : Giá trị phối cảnh `w` của điểm, được biểu thị dưới dạng số dấu phẩy động không giới hạn. Giá trị mặc định là `1`.

### Giá trị trả về

Một đối tượng {{domxref("DOMPoint")}} mới có các giá trị tọa độ và phối cảnh giống với điểm nguồn. Các thuộc tính của điểm có thể thay đổi và có thể được chỉnh sửa bất kỳ lúc nào.

## Ví dụ

### Tạo điểm có thể thay đổi từ điểm chỉ đọc

Nếu bạn có đối tượng {{domxref("DOMPointReadOnly")}}, bạn có thể dễ dàng tạo bản sao có thể thay đổi của điểm đó:

```js
const mutablePoint = DOMPoint.fromPoint(readOnlyPoint);
```

### Tạo điểm 2D

Ví dụ này tạo một điểm 2D, chỉ định một đối tượng nội tuyến chứa các giá trị để dùng cho {{domxref("DOMPointReadOnly.x", "x")}} và {{domxref("DOMPointReadOnly.y", "y")}}. Các thuộc tính _z_ và _w_ được phép giữ giá trị mặc định của chúng (lần lượt là 0 và 1).

```js
const center = DOMPoint.fromPoint({ x: 75, y: -50 });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
