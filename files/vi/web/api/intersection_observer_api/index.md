---
title: Intersection Observer API
slug: Web/API/Intersection_Observer_API
page-type: web-api-overview
browser-compat: api.IntersectionObserver
---

{{DefaultAPISidebar("Intersection Observer API")}}

Intersection Observer API cung cấp một cách để quan sát không đồng bộ các thay đổi trong phần giao nhau của một phần tử đích với một phần tử tổ tiên hoặc với {{Glossary("viewport")}} của tài liệu cấp cao nhất.

## Tổng quan

Trong lịch sử, việc phát hiện khả năng hiển thị của một phần tử, hoặc khả năng hiển thị tương đối của hai phần tử so với nhau, là một tác vụ khó và các giải pháp cho nó thường không đáng tin cậy, dễ khiến trình duyệt và các trang web người dùng đang truy cập trở nên chậm chạp. Khi web phát triển, nhu cầu về loại thông tin này cũng tăng lên. Thông tin giao nhau cần thiết vì nhiều lý do, chẳng hạn như:

- Tải chậm hình ảnh hoặc nội dung khác khi trang được cuộn.
- Triển khai các trang web "cuộn vô hạn", nơi ngày càng nhiều nội dung được tải và hiển thị khi bạn cuộn, để người dùng không phải lật qua từng trang.
- Báo cáo mức độ hiển thị của quảng cáo để tính doanh thu quảng cáo.
- Quyết định có nên thực hiện tác vụ hoặc quá trình hoạt ảnh hay không, dựa trên việc người dùng có nhìn thấy kết quả hay không.

Trong quá khứ, việc triển khai phát hiện giao nhau liên quan đến các trình xử lý sự kiện và các vòng lặp gọi những phương thức như {{domxref("Element.getBoundingClientRect()")}} để thu thập thông tin cần thiết cho từng phần tử bị ảnh hưởng. Vì tất cả mã này chạy trên main thread, chỉ một thành phần như vậy cũng có thể gây ra vấn đề hiệu năng. Khi một site có nhiều phép kiểm tra kiểu này, mọi thứ có thể trở nên rất tệ.

Hãy nghĩ đến một trang web dùng cuộn vô hạn. Nó dùng một thư viện do bên thứ ba cung cấp để quản lý quảng cáo đặt rải rác trên trang, có đồ họa hoạt ảnh ở đây đó, và dùng một thư viện tùy chỉnh vẽ các hộp thông báo và tương tự. Mỗi phần trong số đó có các quy trình phát hiện giao nhau riêng, tất cả đều chạy trên main thread. Tác giả của website thậm chí có thể không nhận ra điều này đang xảy ra, vì họ có thể biết rất ít về hoạt động bên trong của hai thư viện đang dùng. Khi người dùng cuộn trang, các quy trình phát hiện giao nhau này liên tục được kích hoạt trong code xử lý cuộn, tạo ra trải nghiệm khiến người dùng bực bội với trình duyệt, website và cả máy tính của họ.

Intersection Observer API cho phép mã đăng ký một hàm callback sẽ được thực thi bất cứ khi nào một phần tử cụ thể đi vào hoặc đi ra khỏi phần giao nhau với một phần tử khác (hoặc {{Glossary("viewport")}}), hoặc khi phần giao nhau giữa hai phần tử thay đổi một lượng xác định. Nhờ vậy, site không còn phải làm gì trên main thread để theo dõi kiểu giao nhau phần tử này, và trình duyệt có thể tự tối ưu việc quản lý các phần giao nhau theo cách nó thấy phù hợp.

Một điều Intersection Observer API không thể làm: kích hoạt logic dựa trên số pixel chồng lấp chính xác, hoặc cụ thể trên những pixel nào. Nó chỉ giải quyết trường hợp phổ biến kiểu "Nếu chúng giao nhau khoảng _N_% thì tôi cần làm gì đó."

## Khái niệm và cách dùng

Intersection Observer API cho phép bạn cấu hình một callback được gọi khi một trong hai trường hợp sau xảy ra:

- Một phần tử **target** giao nhau với viewport của thiết bị hoặc một phần tử được chỉ định. Phần tử được chỉ định đó được gọi là **root element** hoặc **root** trong ngữ cảnh của Intersection Observer API.
- Lần đầu tiên observer được yêu cầu theo dõi một phần tử target.

Thông thường, bạn sẽ muốn theo dõi thay đổi giao nhau theo phần tử tổ tiên gần nhất có thể cuộn của target, hoặc nếu target không phải là hậu duệ của một phần tử có thể cuộn, thì theo dõi viewport của thiết bị. Để theo dõi giao nhau tương đối với viewport của thiết bị, hãy chỉ định `null` cho tùy chọn `root`. Hãy tiếp tục đọc để xem giải thích chi tiết hơn về các tùy chọn của intersection observer.

Bất kể bạn dùng viewport hay phần tử khác làm root, API hoạt động theo cùng một cách, thực thi một hàm callback mà bạn cung cấp bất cứ khi nào khả năng hiển thị của phần tử target thay đổi sao cho nó vượt qua các mức giao nhau mong muốn với root.

Mức độ giao nhau giữa phần tử target và root của nó là **intersection ratio**. Đây là biểu diễn của phần trăm phần tử target đang hiển thị, dưới dạng giá trị từ 0.0 đến 1.0.

### Tạo một intersection observer

Hãy tạo intersection observer bằng cách gọi constructor của nó và truyền vào một hàm callback sẽ được chạy mỗi khi một ngưỡng bị vượt qua theo một hướng:

```js
const options = {
  root: document.querySelector("#scrollArea"),
  rootMargin: "0px",
  scrollMargin: "0px",
  threshold: 1.0,
};

const observer = new IntersectionObserver(callback, options);
```

#### Theo dõi khả năng hiển thị và độ trễ

Theo mặc định, observer sẽ phát thông báo khi phần tử đích được cuộn vào viewport của root element.
Mặc dù điều này là đủ trong nhiều tình huống, đôi khi điều quan trọng là giao nhau không được báo cáo khi target đã bị "suy giảm về mặt hiển thị".
Ví dụ, khi đo analytics hoặc lượt hiển thị quảng cáo, điều quan trọng là các phần tử đích không bị ẩn hoặc biến dạng, dù toàn bộ hay một phần.

Thiết lập `trackVisibility` cho observer chỉ báo các giao nhau cho những target mà trình duyệt không cho là bị suy giảm hiển thị, chẳng hạn do thay đổi độ mờ, hoặc áp dụng filter hay transform.
Thuật toán này có tính bảo thủ, và có thể bỏ qua những phần tử về mặt kỹ thuật vẫn hiển thị, chẳng hạn như những phần tử chỉ giảm độ mờ một chút.

Phép tính khả năng hiển thị tốn nhiều tài nguyên và chỉ nên dùng khi cần thiết.
Khi theo dõi khả năng hiển thị, cũng nên đặt {{domxref("IntersectionObserver/delay","delay")}} để giới hạn chu kỳ báo cáo tối thiểu.
Khuyến nghị là đặt delay ở giá trị lớn nhất có thể chấp nhận được (độ trễ tối thiểu khi theo dõi khả năng hiển thị là 100 mili giây).

#### Cắt và hình chữ nhật giao nhau

Trình duyệt tính toán hình chữ nhật giao nhau cuối cùng như sau; mọi thứ này đều được làm tự động cho bạn, nhưng việc hiểu các bước đó có thể hữu ích để nắm rõ chính xác khi nào giao nhau sẽ xảy ra.

1. Hình chữ nhật biên của phần tử đích (tức là hình chữ nhật nhỏ nhất bao trùm hoàn toàn hộp giới hạn của mọi thành phần tạo nên phần tử) được lấy bằng cách gọi {{domxref("Element.getBoundingClientRect", "getBoundingClientRect()")}} trên target.
   Đây là kích thước lớn nhất mà hình chữ nhật giao nhau có thể có. Các bước còn lại sẽ loại bỏ mọi phần không giao nhau.
2. Bắt đầu từ khối cha trực tiếp của target và di chuyển ra ngoài, phần cắt của từng containing block (nếu có) sẽ được áp dụng vào hình chữ nhật giao nhau.
   Việc cắt của một khối được xác định dựa trên giao nhau của hai khối và chế độ cắt (nếu có) được chỉ định bởi thuộc tính {{cssxref("overflow")}}. Đặt `overflow` thành bất cứ giá trị nào ngoài `visible` sẽ khiến việc cắt xảy ra.
3. Nếu một trong các phần tử chứa là gốc của một nested browsing context (chẳng hạn tài liệu nằm trong {{HTMLElement("iframe")}}), hình chữ nhật giao nhau được cắt theo viewport của context chứa, và việc đệ quy đi lên qua các container tiếp tục với containing block của container đó. Vì vậy nếu chạm đến cấp cao nhất của một `<iframe>`, hình chữ nhật giao nhau được cắt theo viewport của frame, rồi phần tử cha của frame là khối tiếp theo được đệ quy qua trên đường tới intersection root.
4. Khi đệ quy đi lên đến intersection root, hình chữ nhật kết quả được ánh xạ sang không gian tọa độ của intersection root.
5. Hình chữ nhật kết quả sau đó được cập nhật bằng cách lấy giao với [root intersection rectangle](#the_intersection_root_and_root_margin).
6. Cuối cùng, hình chữ nhật này được ánh xạ sang không gian tọa độ của {{domxref("document")}} của target.


## Interfaces

- {{domxref("IntersectionObserver")}}
  - : Giao diện chính của Intersection Observer API. Cung cấp các phương thức để tạo và quản lý một observer có thể theo dõi bất kỳ số lượng phần tử đích nào với cùng một cấu hình giao nhau. Mỗi observer có thể theo dõi không đồng bộ các thay đổi trong phần giao nhau giữa một hoặc nhiều phần tử đích và một phần tử tổ tiên dùng chung hoặc với {{domxref("Document")}} cấp cao nhất của chúng {{Glossary('viewport')}}. Phần tử tổ tiên hoặc viewport này được gọi là **root**.
- {{domxref("IntersectionObserverEntry")}}
  - : Mô tả phần giao nhau giữa phần tử đích và vùng chứa root của nó tại một thời điểm chuyển trạng thái cụ thể. Đối tượng loại này chỉ có thể thu được theo hai cách: làm đầu vào cho callback `IntersectionObserver`, hoặc bằng cách gọi {{domxref("IntersectionObserver.takeRecords()")}}.

## Ví dụ đơn giản

Ví dụ đơn giản này làm cho một phần tử đích đổi màu và độ trong suốt khi nó trở nên hiển thị nhiều hơn hoặc ít hơn. Ở [Timing element visibility with the Intersection Observer API](/en-US/docs/Web/API/Intersection_Observer_API/Timing_element_visibility), bạn có thể tìm thấy một ví dụ đầy đủ hơn cho thấy cách đo thời gian các phần tử (như quảng cáo) hiển thị với người dùng và phản ứng với thông tin đó bằng cách ghi thống kê hoặc cập nhật phần tử.

### HTML

HTML cho ví dụ này rất ngắn, với một phần tử chính là hộp mà chúng ta sẽ nhắm tới (với creative ID `"box"`) và một số nội dung bên trong hộp.

```html
<div id="box">
  <div class="vertical">Welcome to <strong>The Box!</strong></div>
</div>
```

### CSS

CSS không quá quan trọng cho ví dụ này; nó bố trí phần tử và thiết lập để các thuộc tính {{cssxref("background-color")}} và {{cssxref("border")}} có thể tham gia vào [CSS transitions](/en-US/docs/Web/CSS/Guides/Transitions), thứ mà chúng ta sẽ dùng để tạo ra thay đổi của phần tử khi nó bị che khuất nhiều hơn hoặc ít hơn.

```css
#box {
  background-color: rgb(40 40 190 / 100%);
  border: 4px solid rgb(20 20 120);
  transition:
    background-color 1s,
    border 1s;
  width: 350px;
  height: 350px;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px;
}

.vertical {
  color: white;
  font: 32px "Arial";
}

.extra {
  width: 350px;
  height: 350px;
  margin-top: 10px;
  border: 4px solid rgb(20 20 120);
  text-align: center;
  padding: 20px;
}
```

### JavaScript

Cuối cùng, hãy xem mã JavaScript dùng Intersection Observer API để tạo hiệu ứng.

#### Thiết lập

Trước hết, chúng ta cần chuẩn bị vài biến và cài đặt observer.

```js
const numSteps = 20.0;

const boxElement = document.querySelector("#box");
let prevRatio = 0.0;
let increasingColor = "rgb(40 40 190 / ratio)";
let decreasingColor = "rgb(190 40 40 / ratio)";

createObserver();
```

Các hằng số và biến chúng ta thiết lập ở đây là:

- `numSteps`
  - : Một hằng số cho biết chúng ta muốn có bao nhiêu ngưỡng giữa tỷ lệ hiển thị 0.0 và 1.0.
- `prevRatio`
  - : Biến này sẽ được dùng để ghi nhận tỷ lệ hiển thị vào lần gần nhất một ngưỡng bị vượt qua; điều này cho phép chúng ta biết phần tử đích đang trở nên hiển thị nhiều hơn hay ít hơn.
- `increasingColor`
  - : Một chuỗi định nghĩa màu mà chúng ta sẽ áp dụng cho phần tử đích khi tỷ lệ hiển thị tăng. Từ "ratio" trong chuỗi này sẽ được thay bằng tỷ lệ hiển thị hiện tại của target, vì vậy phần tử không chỉ đổi màu mà còn trở nên ít trong suốt hơn khi bớt bị che khuất.
- `decreasingColor`
  - : Tương tự, đây là một chuỗi định nghĩa màu sẽ được áp dụng khi tỷ lệ hiển thị giảm.

Chúng ta lấy tham chiếu đến phần tử có ID `"box"` bằng {{domxref("Document.querySelector", "querySelector()")}}, rồi gọi phương thức `createObserver()` sẽ được tạo trong chốc lát để xử lý việc xây dựng và cài đặt intersection observer.

#### Tạo intersection observer

Phương thức `createObserver()` được gọi một lần khi tải trang xong để thực sự tạo {{domxref("IntersectionObserver")}} mới và bắt đầu quá trình theo dõi phần tử đích.

```js
function createObserver() {
  const options = {
    root: null,
    rootMargin: "0px",
    threshold: buildThresholdList(),
  };

  const observer = new IntersectionObserver(handleIntersect, options);
  observer.observe(boxElement);
}
```

Phần này bắt đầu bằng việc thiết lập một đối tượng `options` chứa các thiết lập của observer. Chúng ta muốn theo dõi các thay đổi khả năng hiển thị của phần tử đích so với viewport của tài liệu, nên `root` là `null`. Chúng ta không cần margin, vì vậy độ lệch margin, `rootMargin`, được chỉ định là `"0px"`. Điều này khiến observer theo dõi các thay đổi trong phần giao nhau giữa biên của phần tử đích và viewport, mà không có thêm (hoặc bớt) khoảng trống nào.

Danh sách các ngưỡng tỷ lệ hiển thị, `threshold`, được tạo bởi hàm `buildThresholdList()`. Danh sách ngưỡng được xây dựng bằng lập trình trong ví dụ này vì có nhiều giá trị và số lượng được thiết kế để có thể điều chỉnh.

Khi `options` đã sẵn sàng, chúng ta tạo observer mới bằng cách gọi constructor {{domxref("IntersectionObserver.IntersectionObserver", "IntersectionObserver()")}}, chỉ định hàm sẽ được gọi khi giao nhau vượt qua một trong các ngưỡng của chúng ta, `handleIntersect()`, cùng tập tùy chọn. Sau đó chúng ta gọi {{domxref("IntersectionObserver.observe", "observe()")}} trên observer vừa nhận được, truyền vào phần tử đích mong muốn.

Chúng ta cũng có thể theo dõi nhiều phần tử để phát hiện thay đổi giao nhau so với viewport bằng cách gọi `observer.observe()` cho từng phần tử đó, nếu muốn.

#### Xây dựng mảng tỷ lệ ngưỡng

Hàm `buildThresholdList()` xây dựng danh sách ngưỡng như sau:

```js
function buildThresholdList() {
  const thresholds = [];
  const numSteps = 20;

  for (let i = 1.0; i <= numSteps; i++) {
    const ratio = i / numSteps;
    thresholds.push(ratio);
  }

  thresholds.push(0);
  return thresholds;
}
```

Hàm này xây dựng mảng ngưỡng - mỗi phần tử là một tỷ lệ từ 0.0 đến 1.0 - bằng cách đẩy giá trị `i/numSteps` vào mảng `thresholds` cho mỗi số nguyên `i` từ 1 đến `numSteps`. Nó cũng thêm 0 vào để bao gồm giá trị đó. Kết quả, với giá trị mặc định của `numSteps` (20), là danh sách ngưỡng sau:

<table class="standard-table">
    <thead>
      <tr>
        <th>#</th>
        <th>Ratio</th>
        <th>#</th>
        <th>Ratio</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th>0</th>
        <td>0.05</td>
        <th>11</th>
        <td>0.6</td>
      </tr>
      <tr>
        <th>1</th>
        <td>0.1</td>
        <th>12</th>
        <td>0.65</td>
      </tr>
      <tr>
        <th>2</th>
        <td>0.15</td>
        <th>13</th>
        <td>0.7</td>
      </tr>
      <tr>
        <th>3</th>
        <td>0.2</td>
        <th>14</th>
        <td>0.75</td>
      </tr>
      <tr>
        <th>4</th>
        <td>0.25</td>
        <th>15</th>
        <td>0.8</td>
      </tr>
      <tr>
        <th>5</th>
        <td>0.3</td>
        <th>16</th>
        <td>0.85</td>
      </tr>
      <tr>
        <th>6</th>
        <td>0.35</td>
        <th>17</th>
        <td>0.9</td>
      </tr>
      <tr>
        <th>7</th>
        <td>0.4</td>
        <th>18</th>
        <td>0.95</td>
      </tr>
      <tr>
        <th>8</th>
        <td>0.45</td>
        <th>19</th>
        <td>1</td>
      </tr>
      <tr>
        <th>9</th>
        <td>0.5</td>
        <th>20</th>
        <td>0</td>
      </tr>
      <tr>
        <th>10</th>
        <td>0.55</td>
      </tr>
    </tbody>
</table>

Chúng ta có thể, dĩ nhiên, mã hóa cứng mảng ngưỡng vào code, và thường đó là điều bạn sẽ làm. Nhưng ví dụ này chừa chỗ để thêm các điều khiển cấu hình nhằm điều chỉnh độ mịn, chẳng hạn.

#### Xử lý thay đổi giao nhau

Khi trình duyệt phát hiện target đích (trong trường hợp của chúng ta là phần tử có ID `"box"`) đã được làm lộ ra hoặc bị che sao cho tỷ lệ hiển thị của nó vượt qua một trong các ngưỡng trong danh sách, nó sẽ gọi hàm xử lý `handleIntersect()`:

```js
function handleIntersect(entries, observer) {
  entries.forEach((entry) => {
    if (entry.intersectionRatio > prevRatio) {
      entry.target.style.backgroundColor = increasingColor.replace(
        "ratio",
        entry.intersectionRatio,
      );
    } else {
      entry.target.style.backgroundColor = decreasingColor.replace(
        "ratio",
        entry.intersectionRatio,
      );
    }

    prevRatio = entry.intersectionRatio;
  });
}
```

Đối với mỗi {{domxref("IntersectionObserverEntry")}} trong danh sách `entries`, chúng ta kiểm tra xem {{domxref("IntersectionObserverEntry.intersectionRatio", "intersectionRatio")}} của entry có đang tăng hay không; nếu có, chúng ta đặt {{cssxref("background-color")}} của target thành chuỗi trong `increasingColor` (nhớ rằng nó là `"rgb(40 40 190 / ratio)"`), thay từ "ratio" bằng `intersectionRatio` của entry. Kết quả: không chỉ màu bị thay đổi, mà độ trong suốt của phần tử đích cũng thay đổi; khi tỷ lệ giao nhau giảm, giá trị alpha của màu nền cũng giảm theo, tạo ra một phần tử trong suốt hơn.

Tương tự, nếu `intersectionRatio` đang giảm, chúng ta dùng chuỗi `decreasingColor` và thay từ "ratio" trong đó bằng `intersectionRatio` trước khi đặt `background-color` của phần tử đích.

Cuối cùng, để theo dõi xem tỷ lệ giao nhau đang tăng hay giảm, chúng ta ghi nhớ tỷ lệ hiện tại vào biến `prevRatio`.

### Kết quả

Nội dung kết quả như sau. Cuộn trang này lên xuống và chú ý cách diện mạo của hộp thay đổi theo.

{{EmbedLiveSample('A_simple_example', 400, 400)}}

Còn có một ví dụ đầy đủ hơn tại [Timing element visibility with the Intersection Observer API](/en-US/docs/Web/API/Intersection_Observer_API/Timing_element_visibility).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Intersection Observer polyfill](https://github.com/w3c/IntersectionObserver)
- [Timing element visibility with the Intersection Observer API](/en-US/docs/Web/API/Intersection_Observer_API/Timing_element_visibility)
- {{domxref("IntersectionObserver")}} và {{domxref("IntersectionObserverEntry")}}
