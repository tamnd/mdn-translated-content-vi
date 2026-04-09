---
title: BiquadFilterNode
slug: Web/API/BiquadFilterNode
page-type: web-api-interface
browser-compat: api.BiquadFilterNode
---

{{APIRef("Web Audio API")}}

Giao diện `BiquadFilterNode` biểu diễn một bộ lọc đơn giản bậc thấp, và được tạo bằng phương thức {{ domxref("BaseAudioContext/createBiquadFilter") }}. Đây là một {{domxref("AudioNode")}} có thể biểu diễn nhiều loại bộ lọc, thiết bị điều khiển âm sắc và bộ cân bằng đồ họa. Một `BiquadFilterNode` luôn có đúng một đầu vào và một đầu ra.

{{InheritanceDiagram}}

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Số lượng đầu vào</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Số lượng đầu ra</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Chế độ đếm kênh</th>
      <td><code>"max"</code></td>
    </tr>
    <tr>
      <th scope="row">Số lượng kênh</th>
      <td><code>2</code> (không được dùng trong chế độ đếm mặc định)</td>
    </tr>
    <tr>
      <th scope="row">Diễn giải kênh</th>
      <td><code>"speakers"</code></td>
    </tr>
  </tbody>
</table>

## Constructor

- {{domxref("BiquadFilterNode.BiquadFilterNode", "BiquadFilterNode()")}}
  - : Tạo một phiên bản mới của đối tượng `BiquadFilterNode`.

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ đối tượng cha của nó, {{domxref("AudioNode")}}_.

> [!NOTE]
> Mặc dù các đối tượng `AudioParam` được trả về là chỉ đọc, các giá trị mà chúng biểu diễn thì không phải.

- {{domxref("BiquadFilterNode.frequency")}} {{ReadOnlyInline}}
  - : Một {{domxref("AudioParam")}} [a-rate](/en-US/docs/Web/API/AudioParam#a-rate), là một số thực kép biểu diễn tần số trong thuật toán lọc hiện tại, được đo bằng hertz (Hz).
- {{domxref("BiquadFilterNode.detune")}} {{ReadOnlyInline}}
  - : Một {{domxref("AudioParam")}} [a-rate](/en-US/docs/Web/API/AudioParam#a-rate) biểu diễn độ lệch tần số tính theo [cent](https://en.wikipedia.org/wiki/Cent_%28music%29).
- {{domxref("BiquadFilterNode.Q")}} {{ReadOnlyInline}}
  - : Một {{domxref("AudioParam")}} [a-rate](/en-US/docs/Web/API/AudioParam#a-rate), là một số thực kép biểu diễn [hệ số Q](https://en.wikipedia.org/wiki/Q_factor), hay _quality factor_.
- {{domxref("BiquadFilterNode.gain")}} {{ReadOnlyInline}}
  - : Một {{domxref("AudioParam")}} [a-rate](/en-US/docs/Web/API/AudioParam#a-rate), là một số thực kép biểu diễn [gain](https://en.wikipedia.org/wiki/Gain) được dùng trong thuật toán lọc hiện tại.
- {{domxref("BiquadFilterNode.type")}}
  - : Một giá trị chuỗi xác định loại thuật toán lọc mà nút đang triển khai.

    <table class="standard-table">
      <caption>
        Ý nghĩa của các tham số khác nhau tùy theo loại bộ lọc
        (`detune` luôn có cùng ý nghĩa nên không được liệt kê dưới đây)
      </caption>
      <thead>
        <tr>
          <th scope="row"><code>type</code></th>
          <th scope="col">Mô tả</th>
          <th scope="col"><code>frequency</code></th>
          <th scope="col"><code>Q</code></th>
          <th scope="col"><code>gain</code></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row"><code>lowpass</code></th>
          <td>
            Bộ lọc thông thấp cộng hưởng bậc hai tiêu chuẩn với độ dốc suy giảm
            12dB/quãng tám. Các tần số dưới ngưỡng cắt sẽ đi qua; các tần số trên
            ngưỡng cắt sẽ bị suy giảm.
          </td>
          <td>Tần số cắt.</td>
          <td>
            Cho biết đỉnh tần số quanh ngưỡng cắt nhô cao đến mức nào. Giá trị càng
            lớn thì đỉnh càng cao.
          </td>
          <td><em>Không dùng</em></td>
        </tr>
        <tr>
          <th scope="row"><code>highpass</code></th>
          <td>
            Bộ lọc thông cao cộng hưởng bậc hai tiêu chuẩn với độ dốc suy giảm
            12dB/quãng tám. Các tần số dưới ngưỡng cắt bị suy giảm; các tần số trên
            ngưỡng cắt sẽ đi qua.
          </td>
          <td>Tần số cắt.</td>
          <td>
            Cho biết đỉnh tần số quanh ngưỡng cắt nhô cao đến mức nào. Giá trị càng
            lớn thì đỉnh càng cao.
          </td>
          <td><em>Không dùng</em></td>
        </tr>
        <tr>
          <th scope="row"><code>bandpass</code></th>
          <td>
            Bộ lọc thông dải bậc hai tiêu chuẩn. Các tần số nằm ngoài dải tần đã cho
            sẽ bị suy giảm; các tần số nằm trong dải đó sẽ đi qua.
          </td>
          <td>Tâm của dải tần.</td>
          <td>
            Điều khiển độ rộng của dải tần. Giá trị <code>Q</code> càng lớn thì dải
            tần càng hẹp.
          </td>
          <td><em>Không dùng</em></td>
        </tr>
        <tr>
          <th scope="row"><code>lowshelf</code></th>
          <td>
            Bộ lọc lowshelf bậc hai tiêu chuẩn. Các tần số thấp hơn tần số này được
            tăng cường hoặc suy giảm; các tần số cao hơn thì không đổi.
          </td>
          <td>
            Giới hạn trên của các tần số được tăng cường hoặc suy giảm.
          </td>
          <td><em>Không dùng</em></td>
          <td>
            Mức tăng, tính bằng dB, sẽ được áp dụng; nếu âm thì đó là suy giảm.
          </td>
        </tr>
        <tr>
          <th scope="row"><code>highshelf</code></th>
          <td>
            Bộ lọc highshelf bậc hai tiêu chuẩn. Các tần số cao hơn tần số này được
            tăng cường hoặc suy giảm; các tần số thấp hơn thì không đổi.
          </td>
          <td>
            Giới hạn dưới của các tần số được tăng cường hoặc suy giảm.
          </td>
          <td><em>Không dùng</em></td>
          <td>
            Mức tăng, tính bằng dB, sẽ được áp dụng; nếu âm thì đó là suy giảm.
          </td>
        </tr>
        <tr>
          <th scope="row"><code>peaking</code></th>
          <td>
            Các tần số trong dải được tăng cường hoặc suy giảm; các tần số ngoài dải
            thì không đổi.
          </td>
          <td>
            Giữa của dải tần được tăng cường hoặc suy giảm.
          </td>
          <td>
            Điều khiển độ rộng của dải tần. Giá trị <code>Q</code> càng lớn thì dải
            tần càng hẹp.
          </td>
          <td>
            Mức tăng, tính bằng dB, sẽ được áp dụng; nếu âm thì đó là suy giảm.
          </td>
        </tr>
        <tr>
          <th scope="row"><code>notch</code></th>
          <td>
            Bộ lọc
            <a href="https://en.wikipedia.org/wiki/Band-stop_filter">notch</a>
            tiêu chuẩn, còn được gọi là bộ lọc <em>band-stop</em> hoặc
            <em>band-rejection</em>. Nó ngược với bộ lọc bandpass: các tần số nằm
            ngoài dải tần đã cho sẽ đi qua; các tần số nằm trong dải sẽ bị suy giảm.
          </td>
          <td>Tâm của dải tần.</td>
          <td>
            Điều khiển độ rộng của dải tần. Giá trị <code>Q</code> càng lớn thì dải
            tần càng hẹp.
          </td>
          <td><em>Không dùng</em></td>
        </tr>
        <tr>
          <th scope="row"><code>allpass</code></th>
          <td>
            Bộ lọc
            <a
              href="https://en.wikipedia.org/wiki/All-pass_filter#Digital_Implementation"
              >allpass</a
            >
            bậc hai tiêu chuẩn. Nó cho mọi tần số đi qua, nhưng thay đổi quan hệ
            pha giữa các tần số khác nhau.
          </td>
          <td>
            Tần số có
            <a href="https://en.wikipedia.org/wiki/Group_delay_and_phase_delay"
              >độ trễ nhóm</a
            >
            lớn nhất, tức tần số nơi tâm của chuyển tiếp pha xuất hiện.
          </td>
          <td>
            Điều khiển độ sắc của chuyển tiếp tại tần số trung tâm. Tham số này càng
            lớn thì chuyển tiếp càng sắc và càng lớn.
          </td>
          <td><em>Không dùng</em></td>
        </tr>
      </tbody>
    </table>

## Phương thức thể hiện

_Kế thừa các phương thức từ đối tượng cha của nó, {{domxref("AudioNode")}}_.

- {{domxref("BiquadFilterNode.getFrequencyResponse()")}}
  - : Từ các thiết lập tham số hiện tại của bộ lọc, phương thức này tính đáp ứng tần số cho các tần số được chỉ định trong mảng tần số được cung cấp.

## Ví dụ

Xem [`AudioContext.createBiquadFilter`](/en-US/docs/Web/API/BaseAudioContext/createBiquadFilter#examples) để biết mã ví dụ cho thấy cách dùng `AudioContext` nhằm tạo một nút bộ lọc Biquad.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
