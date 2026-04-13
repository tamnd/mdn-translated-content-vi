---
title: "BiquadFilterNode: thuộc tính type"
short-title: type
slug: Web/API/BiquadFilterNode/type
page-type: web-api-instance-property
browser-compat: api.BiquadFilterNode.type
---

{{ APIRef("Web Audio API") }}

Thuộc tính `type` của giao diện {{ domxref("BiquadFilterNode") }} là một giá trị chuỗi (enum) xác định loại thuật toán lọc mà nút đang triển khai.

## Giá trị

Một chuỗi (enum) biểu diễn một [BiquadFilterType](https://webaudio.github.io/web-audio-api/#idl-def-BiquadFilterType).

## Các giá trị `type` và ý nghĩa của chúng

<table class="standard-table">
  <tbody>
    <tr>
      <th scope="row"><code>type</code></th>
      <th scope="col">Mô tả</th>
      <th scope="col"><code>frequency</code></th>
      <th scope="col"><code>Q</code></th>
      <th scope="col"><code>gain</code></th>
    </tr>
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
        tần càng rộng.
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
        tần càng rộng.
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
        tần càng rộng.
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
        > lớn nhất, tức tần số nơi tâm của chuyển tiếp pha xuất hiện.
      </td>
      <td>
        Điều khiển độ sắc của chuyển tiếp tại tần số trung tâm. Tham số này càng
        lớn thì chuyển tiếp càng sắc và càng lớn.
      </td>
      <td><em>Không dùng</em></td>
    </tr>
  </tbody>
</table>

## Ví dụ

Ví dụ sau cho thấy cách dùng cơ bản của một AudioContext để tạo một nút bộ lọc Biquad.
Để xem ví dụ/thông tin đầy đủ hơn, hãy tham khảo bản minh họa [Voice-change-O-matic](https://github.com/mdn/webaudio-examples/tree/main/voice-change-o-matic) của chúng tôi (xem [các dòng 108–193 trong app.js](https://github.com/mdn/webaudio-examples/blob/main/voice-change-o-matic/scripts/app.js#L108-L193) để biết phần mã liên quan).

```js
const audioCtx = new AudioContext();

// Set up the different audio nodes we will use for the app
const analyser = audioCtx.createAnalyser();
const distortion = audioCtx.createWaveShaper();
const gainNode = audioCtx.createGain();
const biquadFilter = audioCtx.createBiquadFilter();
const convolver = audioCtx.createConvolver();

// Connect the nodes together

source = audioCtx.createMediaStreamSource(stream);
source.connect(analyser);
analyser.connect(distortion);
distortion.connect(biquadFilter);
biquadFilter.connect(convolver);
convolver.connect(gainNode);
gainNode.connect(audioCtx.destination);

// Manipulate the Biquad filter

biquadFilter.type = "lowshelf";
biquadFilter.frequency.value = 1000;
biquadFilter.gain.value = 25;
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
