---
title: "WebGLRenderingContext: isContextLost() method"
short-title: isContextLost()
slug: Web/API/WebGLRenderingContext/isContextLost
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.isContextLost
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.isContextLost()`** trả về một giá trị boolean cho biết bối cảnh WebGL có bị mất hay không và phải được thiết lập lại trước khi quá trình kết xuất có thể tiếp tục.

## Cú pháp

```js-nolint
isContextLost()
```

### Thông số

Không có.

### Giá trị trả về

Một giá trị boolean là `true` nếu ngữ cảnh bị mất, hoặc `false` nếu không.

## ghi chú sử dụng

Có một số lý do khiến bối cảnh WebGL có thể bị mất, do đó cần phải thiết lập lại bối cảnh trước khi tiếp tục hiển thị. Ví dụ bao gồm:

- Hai hoặc nhiều trang đang sử dụng GPU nhưng cùng nhau đặt ra yêu cầu quá cao về
GPU, do đó, trình duyệt sẽ thông báo cho hai bối cảnh rằng chúng đã mất kết nối, sau đó chọn một trong hai bối cảnh để khôi phục quyền truy cập.
- Máy tính của người dùng có nhiều bộ xử lý đồ họa (chẳng hạn như máy tính xách tay có cả hai bộ xử lý đồ họa).
GPU loại dành cho thiết bị di động và máy tính để bàn, loại trước đây được sử dụng chủ yếu khi sử dụng nguồn pin) và người dùng hoặc hệ thống quyết định chuyển đổi GPU. Trong trường hợp này, tất cả ngữ cảnh đều bị mất và được khôi phục sau khi chuyển đổi GPU.
- Một trang khác đang chạy trong trình duyệt của người dùng thực hiện thao tác sử dụng GPU
mất quá nhiều thời gian, khiến trình duyệt quyết định thiết lập lại GPU để phá vỡ tình trạng treo. Điều này sẽ khiến mọi bối cảnh WebGL bị mất trong toàn bộ trình duyệt.
- Người dùng cập nhật trình điều khiển đồ họa của họ trên hệ điều hành cho phép đồ họa
trình điều khiển được cập nhật mà không cần khởi động lại hệ thống.

## Ví dụ

Ví dụ: khi kiểm tra liên kết chương trình thành công, bạn cũng có thể kiểm tra xem ngữ cảnh có bị mất hay không:

```js
gl.linkProgram(program);

if (!gl.getProgramParameter(program, gl.LINK_STATUS) && !gl.isContextLost()) {
  const info = gl.getProgramInfoLog(program);
  console.log(`Error linking program:\n${info}`);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLContextEvent")}} báo hiệu những thay đổi trong trạng thái ngữ cảnh.
- [Xử lý ngữ cảnh bị mất trong WebGL](https://wikis.khronos.org/webgl/HandlingContextLost): Khronos WebGL wiki
