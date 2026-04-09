---
title: "ConstantSourceNode: thuộc tính offset"
short-title: offset
slug: Web/API/ConstantSourceNode/offset
page-type: web-api-instance-property
browser-compat: api.ConstantSourceNode.offset
---

{{ APIRef("Web Audio API") }}

Thuộc tính chỉ đọc `offset` của giao diện {{ domxref("ConstantSourceNode") }} trả về một đối tượng {{domxref("AudioParam")}} biểu thị giá trị số [a-rate](/en-US/docs/Web/API/AudioParam#a-rate) luôn được nguồn trả về khi được yêu cầu cung cấp mẫu tiếp theo.

> [!NOTE]
> Mặc dù `AudioParam` có tên `offset` là chỉ đọc, thuộc tính `value` bên trong nó thì không. Vì vậy bạn có thể thay đổi giá trị của `offset` bằng cách thiết lập giá trị của `ConstantSourceNode.offset.value`:
>
> ```js
> myConstantSourceNode.offset.value = newValue;
> ```

## Giá trị

Một đối tượng {{ domxref("AudioParam") }} biểu thị giá trị [a-rate](/en-US/docs/Web/API/AudioParam#a-rate) được nút này trả về cho mọi mẫu. Giá trị mặc định là 1.0.

Để truy cập giá trị hiện tại của tham số `offset`, hãy truy cập thuộc tính `value` của tham số đó, như minh họa trong khối cú pháp ở trên.

## Ví dụ

Ví dụ này minh họa cách thiết lập một `ConstantSourceNode` để `offset` của nó được dùng làm đầu vào cho một cặp {{domxref("GainNode")}}; đoạn mã này được trích từ ví dụ hoàn chỉnh mà bạn có thể xem trong [Điều khiển nhiều tham số bằng ConstantSourceNode](/en-US/docs/Web/API/Web_Audio_API/Controlling_multiple_parameters_with_ConstantSourceNode).

```js
gainNode2 = context.createGain();
gainNode3 = context.createGain();
gainNode2.gain.value = gainNode3.gain.value = 0.5;

volumeSliderControl.value = gainNode2.gain.value;

constantSource = context.createConstantSource();
constantSource.connect(gainNode2.gain);
constantSource.connect(gainNode3.gain);
```

Trước tiên, các nút gain được tạo và cấu hình, đồng thời giá trị của một điều khiển thanh trượt được đặt để khớp với hệ số gain của hai nút đó. Sau đó chúng ta tạo một {{domxref("ConstantSourceNode")}} mới và biến nó thành nguồn cho các giá trị {{domxref("GainNode.gain")}} của hai nút gain. Mỗi giá trị trong số đó cũng là một {{domxref("AudioParam")}}.

Giả sử chúng ta có một trình xử lý sự kiện (trong trường hợp này là cho sự kiện {{domxref("Element/click_event", "click")}}) cần phản hồi bằng cách thay đổi giá trị của hai nút gain. Khi liên kết ở trên đã được thiết lập, việc đó có thể được thực hiện bằng trình xử lý sự kiện đơn giản này:

```js
function handleClickEvent(event) {
  constantSource.offset.value = volumeSliderControl.value;
}
```

Tất cả những gì hàm này cần làm là lấy giá trị hiện tại của điều khiển thanh trượt mà chúng ta dùng để điều khiển gain của cặp nút, rồi lưu giá trị đó vào tham số `offset` của `ConstantSourceNode`. Việc này được thực hiện bằng cách thay đổi nội dung của thuộc tính {{domxref("AudioParam.value")}} của nó. Hai nút gain nhanh chóng nhận mức âm lượng mới.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- {{domxref("ConstantSourceNode")}}
- {{domxref("AudioNode")}}
- {{domxref("AudioParam")}}
