---
title: "BiquadFilterNode: hàm khởi tạo BiquadFilterNode()"
short-title: BiquadFilterNode()
slug: Web/API/BiquadFilterNode/BiquadFilterNode
page-type: web-api-constructor
browser-compat: api.BiquadFilterNode.BiquadFilterNode
---

{{APIRef("Web Audio API")}}

Hàm khởi tạo **`BiquadFilterNode()`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) tạo một đối tượng {{domxref("BiquadFilterNode")}} mới, đối tượng này biểu diễn một bộ lọc đơn giản bậc thấp.

## Cú pháp

```js-nolint
new BiquadFilterNode(context, options)
```

### Tham số

- `context`
  - : Tham chiếu đến một {{domxref("AudioContext")}}.
- `options` {{optional_inline}}
  - : Một đối tượng có các thuộc tính sau:
    - `type`
      - : Một trong các chuỗi sau. Ý nghĩa của các tùy chọn khác phụ thuộc vào giá trị của `type`.
        - `lowpass`
          - : Giá trị mặc định. Cho phép các tần số dưới một ngưỡng cắt đi qua, đồng thời suy giảm các tần số trên ngưỡng cắt. Đây là bộ lọc thông thấp cộng hưởng bậc hai tiêu chuẩn với độ dốc suy giảm 12dB/quãng tám. Với loại bộ lọc này, ý nghĩa của các tùy chọn khác như sau:
            - `Q`: điều khiển độ nhô của đáp ứng tại tần số cắt. Giá trị lớn làm đáp ứng nhô cao hơn. Lưu ý rằng với loại bộ lọc này, giá trị này không phải Q theo nghĩa truyền thống mà là giá trị cộng hưởng tính bằng decibel.
            - `frequency`: tần số cắt.
            - `gain`: không dùng.

        - `highpass`
          - : Bộ lọc thông cao là đối lập với bộ lọc thông thấp. Các tần số trên ngưỡng cắt sẽ đi qua, nhưng các tần số dưới ngưỡng cắt sẽ bị suy giảm. Nó triển khai một bộ lọc thông cao cộng hưởng bậc hai tiêu chuẩn với độ dốc suy giảm 12dB/quãng tám. Với loại bộ lọc này, ý nghĩa của các tùy chọn khác như sau:
            - `Q`: điều khiển độ nhô của đáp ứng tại tần số cắt. Giá trị lớn làm đáp ứng nhô cao hơn. Lưu ý rằng với loại bộ lọc này, giá trị này không phải Q theo nghĩa truyền thống mà là giá trị cộng hưởng tính bằng decibel.
            - `frequency`: tần số cắt.
            - `gain`: không dùng.

        - `bandpass`
          - : Bộ lọc thông dải cho phép một dải tần số đi qua và suy giảm các tần số thấp hơn hoặc cao hơn dải này. Nó triển khai bộ lọc thông dải bậc hai. Với loại bộ lọc này, ý nghĩa của các tùy chọn khác như sau:
            - `Q`: điều khiển độ rộng của dải. Độ rộng trở nên hẹp hơn khi giá trị Q tăng.
            - `frequency`: tâm của dải tần.
            - `gain`: không dùng.

        - `lowshelf`
          - : Bộ lọc lowshelf cho phép mọi tần số đi qua, nhưng tăng cường (hoặc suy giảm) các tần số thấp hơn. Nó triển khai bộ lọc lowshelf bậc hai. Với loại bộ lọc này, ý nghĩa của các tùy chọn khác như sau:
            - `Q`: không dùng.
            - `frequency`: giới hạn trên của các tần số nơi mức tăng hoặc suy giảm được áp dụng.
            - `gain`: mức tăng, tính bằng dB, sẽ được áp dụng. Nếu giá trị âm, các tần số sẽ bị suy giảm.

        - `highshelf`
          - : Bộ lọc highshelf là đối lập với bộ lọc lowshelf và cho phép mọi tần số đi qua, nhưng tăng cường các tần số cao hơn. Nó triển khai bộ lọc highshelf bậc hai. Với loại bộ lọc này, ý nghĩa của các tùy chọn khác như sau:
            - `Q`: không dùng.
            - `frequency`: giới hạn dưới của các tần số nơi mức tăng hoặc suy giảm được áp dụng.
            - `gain`: mức tăng, tính bằng dB, sẽ được áp dụng. Nếu giá trị âm, các tần số sẽ bị suy giảm.

        - `peaking`
          - : Bộ lọc peaking cho phép mọi tần số đi qua, đồng thời tăng cường hoặc suy giảm một dải tần. Với loại bộ lọc này, ý nghĩa của các tùy chọn khác như sau:
            - `Q`: độ rộng của dải tần được tăng cường. Giá trị lớn ngụ ý độ rộng hẹp.
            - `frequency`: tần số trung tâm của dải tăng cường.
            - `gain`: mức tăng, tính bằng dB, sẽ được áp dụng. Nếu giá trị âm, các tần số sẽ bị suy giảm.

        - `notch`
          - : Bộ lọc notch (còn gọi là bộ lọc band-stop hoặc band-rejection) đối lập với bộ lọc bandpass. Nó cho phép mọi tần số đi qua, ngoại trừ một tập tần số nhất định. Với loại bộ lọc này, ý nghĩa của các tùy chọn khác như sau:
            - `Q`: độ rộng của dải tần bị suy giảm. Giá trị lớn ngụ ý độ rộng hẹp.
            - `frequency`: tần số trung tâm của dải suy giảm.
            - `gain`: không dùng.

        - `allpass`
          - : Bộ lọc allpass cho phép mọi tần số đi qua, nhưng thay đổi quan hệ pha giữa các tần số khác nhau. Nó triển khai bộ lọc allpass bậc hai. Với loại bộ lọc này, ý nghĩa của các tùy chọn khác như sau:
            - `Q`: độ sắc của chuyển tiếp pha tại tần số trung tâm. Giá trị lớn hơn ngụ ý chuyển tiếp sắc hơn và độ trễ nhóm lớn hơn.
            - `frequency`: tần số nơi tâm của chuyển tiếp pha xuất hiện. Nhìn theo cách khác, đây là tần số có độ trễ nhóm cực đại.
            - `gain`: không dùng.

    - `Q`
      - : Mặc định là `1`. Ý nghĩa của tùy chọn này phụ thuộc vào giá trị của `type`.
    - `detune`
      - : Mặc định là `0`.
    - `frequency`
      - : Mặc định là `350`.
    - `gain`
      - : Mặc định là `0`. Ý nghĩa của tùy chọn này phụ thuộc vào giá trị của `type`.
    - `channelCount`
      - : Biểu diễn một số nguyên dùng để xác định có bao nhiêu kênh được dùng khi [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) các kết nối tới bất kỳ đầu vào nào của nút. (Xem {{domxref("AudioNode.channelCount")}} để biết thêm thông tin.) Cách dùng và định nghĩa chính xác của nó phụ thuộc vào giá trị của `channelCountMode`.
    - `channelCountMode`
      - : Biểu diễn một giá trị [liệt kê](/en-US/docs/Glossary/Enumerated) mô tả cách các kênh phải được khớp giữa đầu vào và đầu ra của nút. (Xem {{domxref("AudioNode.channelCountMode")}} để biết thêm thông tin, bao gồm cả giá trị mặc định.)
    - `channelInterpretation`
      - : Biểu diễn một giá trị liệt kê mô tả ý nghĩa của các kênh. Cách diễn giải này sẽ xác định cách âm thanh được [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing). Các giá trị có thể có là `"speakers"` hoặc `"discrete"`. (Xem {{domxref("AudioNode.channelCountMode")}} để biết thêm thông tin, bao gồm cả giá trị mặc định.)

### Giá trị trả về

Một phiên bản đối tượng {{domxref("BiquadFilterNode")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
