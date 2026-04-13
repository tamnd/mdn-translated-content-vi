---
title: "AudioWorkletProcessor: phương thức process()"
short-title: process()
slug: Web/API/AudioWorkletProcessor/process
page-type: web-api-instance-method
spec-urls: https://webaudio.github.io/web-audio-api/#process
---

{{APIRef("Web Audio API")}}

Phương thức **`process()`** của một lớp dẫn xuất từ {{domxref("AudioWorkletProcessor")}} triển khai thuật toán xử lý âm thanh cho worklet xử lý âm thanh.

Mặc dù phương thức này không phải là một phần của giao diện {{domxref("AudioWorkletProcessor")}}, mọi phần cài đặt của `AudioWorkletProcessor` đều phải cung cấp một phương thức `process()`.

Phương thức này được gọi đồng bộ từ luồng kết xuất âm thanh, một lần cho mỗi khối âm thanh (còn gọi là một lượng tử kết xuất) đang được chuyển qua {{domxref("AudioWorkletNode")}} tương ứng của processor. Nói cách khác, mỗi khi một khối âm thanh mới sẵn sàng để processor của bạn thao tác, hàm `process()` sẽ được gọi để thực hiện việc đó.

> [!NOTE]
> Hiện tại, các khối dữ liệu âm thanh luôn dài 128 khung, tức là chúng chứa 128 mẫu số thực dấu chấm động 32 bit cho mỗi kênh của đầu vào. Tuy nhiên, đã có kế hoạch sửa đổi đặc tả để cho phép thay đổi kích thước khối âm thanh tùy theo hoàn cảnh (ví dụ, nếu phần cứng âm thanh hoặc mức sử dụng CPU hoạt động hiệu quả hơn với kích thước khối lớn hơn).
> Vì vậy, bạn _luôn phải kiểm tra kích thước của mảng mẫu_ thay vì giả định một kích thước cụ thể.
>
> Kích thước này thậm chí có thể được phép thay đổi theo thời gian, nên bạn không được chỉ nhìn khối đầu tiên rồi cho rằng các bộ đệm mẫu sẽ luôn có cùng kích thước.

## Cú pháp

```js-nolint
process(inputs, outputs, parameters)
```

### Tham số

- `inputs`
  - : Một mảng các _đầu vào_ được kết nối với nút; mỗi phần tử của nó lại là một mảng các _kênh_. Mỗi _kênh_ là một {{jsxref("Float32Array")}} chứa 128 mẫu. Ví dụ, `inputs[n][m][i]` sẽ truy cập đầu vào thứ _n_, kênh thứ _m_ của đầu vào đó, và mẫu thứ _i_ của kênh đó.

    Mỗi giá trị mẫu nằm trong khoảng `[-1 .. 1]`.

    Số lượng _đầu vào_, và do đó độ dài của mảng này, được cố định tại thời điểm tạo nút (xem {{domxref("AudioWorkletNode")}}). Nếu không có nút hoạt động nào được kết nối tới đầu vào thứ _n_ của nút, `inputs[n]` sẽ là một mảng rỗng (không có kênh đầu vào khả dụng).

    Số lượng _kênh_ trong mỗi đầu vào có thể thay đổi, tùy thuộc vào các thuộc tính {{domxref("AudioNode.channelCount", "channelCount")}} và {{domxref("AudioNode.channelCountMode", "channelCountMode")}}.

- `outputs`
  - : Một mảng các _đầu ra_ có cấu trúc tương tự tham số `inputs`. Nó được thiết kế để được điền trong quá trình thực thi phương thức `process()`. Mỗi kênh đầu ra mặc định được điền bằng số không; processor sẽ xuất im lặng trừ khi các mảng đầu ra được sửa đổi.
- `parameters`
  - : Một đối tượng chứa các khóa chuỗi và các giá trị {{jsxref("Float32Array")}}. Với mỗi {{domxref("AudioParam")}} tùy chỉnh được định nghĩa bằng getter {{domxref("AudioWorkletProcessor.parameterDescriptors", "parameterDescriptors")}}, khóa trong đối tượng là `name` của {{domxref("AudioParam")}} đó, còn giá trị là một {{jsxref("Float32Array")}}. Các giá trị của mảng được tính toán có xét đến các sự kiện tự động hóa đã được lên lịch.

    Nếu tốc độ tự động hóa của tham số là [`"a-rate"`](/en-US/docs/Web/API/AudioParam#a-rate), mảng sẽ chứa 128 giá trị, một giá trị cho mỗi khung trong khối âm thanh hiện tại. Nếu không có tự động hóa nào diễn ra trong khoảng thời gian được biểu diễn bởi khối hiện tại, mảng có thể chỉ chứa một giá trị không đổi cho toàn bộ khối thay vì 128 giá trị giống hệt nhau.

    Nếu tốc độ tự động hóa là [`"k-rate"`](/en-US/docs/Web/API/AudioParam#k-rate), mảng sẽ chỉ chứa một giá trị duy nhất để dùng cho cả 128 khung.

### Giá trị trả về

Một giá trị Boolean cho biết có ép {{domxref("AudioWorkletNode")}} tiếp tục hoạt động hay không, ngay cả khi logic nội bộ của {{Glossary("user agent", "trình đại diện người dùng")}} lẽ ra đã quyết định rằng có thể tắt nút an toàn.

Giá trị trả về cho phép processor của bạn ảnh hưởng đến chính sách vòng đời của {{domxref("AudioWorkletProcessor")}} và nút sở hữu nó. Nếu sự kết hợp giữa giá trị trả về và trạng thái của nút khiến trình duyệt quyết định dừng nút, `process()` sẽ không được gọi nữa.

Trả về `true` buộc Web Audio API giữ nút sống, còn trả về `false` cho phép trình duyệt chấm dứt nút nếu nó không tạo dữ liệu âm thanh mới và cũng không nhận dữ liệu qua các đầu vào để xử lý.

Ba loại nút âm thanh phổ biến nhất là:

1. Nguồn tạo đầu ra. Một {{domxref("AudioWorkletProcessor")}} triển khai loại nút này nên trả về `true` từ phương thức `process` chừng nào nó còn tạo đầu ra. Phương thức nên trả về `false` ngay khi biết rằng nó sẽ không còn tạo đầu ra nữa. Ví dụ, với {{domxref("AudioBufferSourceNode")}}, processor phía sau một nút như vậy nên trả về `true` từ phương thức `process` khi bộ đệm đang phát, và bắt đầu trả về `false` khi việc phát kết thúc (không có cách nào gọi `play` trên cùng một {{domxref("AudioBufferSourceNode")}} lần nữa).
2. Nút biến đổi đầu vào của nó. Processor triển khai loại nút này nên trả về `false` từ phương thức `process` để sự hiện diện của các nút đầu vào đang hoạt động và các tham chiếu đến nút quyết định xem nó có thể được thu gom rác hay không. Ví dụ về nút có hành vi này là {{domxref("GainNode")}}. Khi không còn đầu vào nào được kết nối và không còn tham chiếu được giữ lại, gain không thể tiếp tục được áp dụng cho bất cứ thứ gì, nên nút có thể được thu gom rác an toàn.
3. Nút biến đổi đầu vào của nó nhưng có cái gọi là _tail-time_ - nghĩa là nó sẽ tiếp tục tạo đầu ra thêm một khoảng thời gian ngay cả sau khi đầu vào bị ngắt kết nối hoặc không còn hoạt động (tạo ra zero-channels). Processor triển khai loại nút này nên trả về `true` từ phương thức `process` trong suốt giai đoạn _tail-time_, bắt đầu ngay khi phát hiện các đầu vào chứa zero-channels. Ví dụ về một nút như vậy là {{domxref("DelayNode")}}; nó có _tail-time_ bằng với thuộc tính {{domxref("DelayNode.delayTime", "delayTime")}} của nó.

> [!NOTE]
> Việc không có câu lệnh `return` có nghĩa là phương thức trả về `undefined`, và vì đây là một giá trị falsy, nó tương đương với việc trả về `false`.
> Việc bỏ qua câu lệnh `return` tường minh có thể gây ra những vấn đề khó phát hiện đối với các nút của bạn.

### Ngoại lệ

Vì phương thức `process()` do người dùng triển khai, nó có thể ném ra bất cứ thứ gì. Nếu một lỗi không được bắt bị ném ra, nút sẽ phát ra sự kiện {{domxref("AudioWorkletNode.processorerror_event", "processorerror")}} và xuất im lặng trong suốt phần đời còn lại của nó.

## Ví dụ

Trong ví dụ này, chúng ta tạo một `AudioWorkletProcessor` xuất nhiễu trắng tới đầu ra đầu tiên. Gain có thể được điều khiển bằng tham số `customGain`.

```js
class WhiteNoiseProcessor extends AudioWorkletProcessor {
  process(inputs, outputs, parameters) {
    // lấy đầu ra đầu tiên
    const output = outputs[0];
    // điền mỗi kênh bằng các giá trị ngẫu nhiên được nhân với gain
    output.forEach((channel) => {
      for (let i = 0; i < channel.length; i++) {
        // tạo giá trị ngẫu nhiên cho từng mẫu
        // khoảng của Math.random là [0; 1); chúng ta cần [-1; 1]
        // cách này sẽ không bao gồm đúng giá trị 1, nhưng hiện tại vẫn ổn để đơn giản
        channel[i] =
          (Math.random() * 2 - 1) *
          // mảng có thể chứa 1 hoặc 128 giá trị
          // tùy thuộc có tự động hóa hay không
          // và tốc độ tự động hóa là k-rate hay a-rate
          (parameters["customGain"].length > 1
            ? parameters["customGain"][i]
            : parameters["customGain"][0]);
      }
    });
    // vì đây là một source node tự tạo đầu ra riêng,
    // chúng ta trả về true để nó không vô tình bị thu gom rác
    // nếu không còn tham chiếu nào tới nó trên luồng chính
    return true;
  }
  // định nghĩa tham số customGain được dùng trong phương thức process
  static get parameterDescriptors() {
    return [
      {
        name: "customGain",
        defaultValue: 1,
        minValue: 0,
        maxValue: 1,
        automationRate: "a-rate",
      },
    ];
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

Đây không phải là một phương thức do trình duyệt cung cấp mà là một phương thức callback phải được viết trong mã phía máy khách.

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
