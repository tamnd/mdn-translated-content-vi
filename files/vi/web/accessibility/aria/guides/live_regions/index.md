---
title: Vùng live ARIA
slug: Web/Accessibility/ARIA/Guides/Live_regions
page-type: guide
sidebar: accessibilitysidebar
---

Bằng JavaScript, có thể thay đổi động các phần của trang mà không cần tải lại toàn bộ trang - ví dụ, để cập nhật danh sách kết quả tìm kiếm theo thời gian thực, hoặc để hiển thị một cảnh báo hay thông báo kín đáo không cần người dùng tương tác. Trong khi các thay đổi này thường hiển thị rõ với người dùng nhìn thấy được trang, chúng có thể không rõ ràng với người dùng công nghệ trợ năng. Vùng live ARIA lấp đầy khoảng trống này và cung cấp một cách để hiển thị có lập trình các thay đổi nội dung động theo cách mà công nghệ trợ năng có thể thông báo.

> [!NOTE]
> Công nghệ trợ năng thường chỉ thông báo các thay đổi _động_ trong nội dung của một vùng live.
> Việc thêm thuộc tính `aria-live` hoặc một `role` vùng live chuyên biệt (chẳng hạn [`role="status"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/status_role)) vào phần tử mà bạn muốn thông báo thay đổi sẽ hoạt động miễn là bạn thêm thuộc tính trước khi thay đổi xảy ra - hoặc trong đánh dấu ban đầu, hoặc động bằng JavaScript. Hãy bắt đầu với một vùng live trống, rồi - ở một bước riêng - thay đổi nội dung bên trong vùng đó.
> Mặc dù không được nêu rõ trong đặc tả, trình duyệt/công nghệ trợ năng có xử lý đặc biệt cho [`role="alert"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alert_role): trong hầu hết trường hợp, nội dung bên trong vùng `role="alert"` sẽ được thông báo, ngay cả khi vùng đó (vốn đã chứa thông báo) có mặt trong đánh dấu ban đầu của trang, hoặc được chèn động vào trang. Tuy nhiên, lưu ý rằng các vùng `role="alert"` - tùy theo tổ hợp trình duyệt/công nghệ trợ năng cụ thể - sẽ tự động được thêm tiền tố "Alert" khi được thông báo.

## Vùng live

Nội dung động được cập nhật mà không tải lại trang thường là một vùng hoặc một widget. Các thay đổi nội dung đơn giản không mang tính tương tác nên được đánh dấu là vùng live. Một vùng live được chỉ định rõ bằng thuộc tính `aria-live`.

**`aria-live`**: `aria-live=POLITENESS_SETTING` được dùng để đặt mức độ ưu tiên mà trình đọc màn hình sẽ dùng khi xử lý các cập nhật của vùng live - các giá trị có thể là `off`, `polite`, hoặc `assertive`. Đây là thuộc tính quan trọng nhất.

Thông thường, chỉ dùng `aria-live="polite"`. Bất kỳ vùng nào nhận các cập nhật quan trọng đối với người dùng, nhưng không quá dồn dập đến mức gây khó chịu, nên nhận thuộc tính này. Trình đọc màn hình sẽ đọc các thay đổi khi người dùng đang rảnh.

`aria-live="assertive"` chỉ nên dùng cho các thông báo nhạy cảm về thời gian hoặc quan trọng tới mức thực sự đòi hỏi sự chú ý ngay lập tức của người dùng. Thông thường, thay đổi trong vùng live assertive sẽ ngắt bất kỳ thông báo nào mà trình đọc màn hình đang phát. Vì vậy, nó có thể cực kỳ gây khó chịu và làm gián đoạn, nên chỉ nên dùng thật hạn chế.

Ngược lại một cách trực giác, `aria-live="off"` không có nghĩa là các thay đổi sẽ không được thông báo. Khi một phần tử có `aria-live="off"` (hoặc có một `role` với giá trị ngầm định này, như `role="marquee"` hoặc `role="timer"`), các thay đổi nội dung của phần tử chỉ được thông báo khi tiêu điểm ở trên, hoặc bên trong, phần tử đó.

### Ví dụ cơ bản: hộp chọn thả xuống cập nhật thông tin hữu ích trên màn hình

Một website chuyên cung cấp thông tin về các hành tinh có một hộp chọn thả xuống. Khi người dùng chọn một hành tinh trong danh sách, một vùng trên trang sẽ được cập nhật với thông tin về hành tinh đã chọn.

```html
<fieldset>
  <legend>Thông tin hành tinh</legend>
  <label for="planetsSelect">Hành tinh:</label>
  <select id="planetsSelect" aria-controls="planetInfo">
    <option value="">Chọn một hành tinh…</option>
    <option value="mercury">Sao Thủy</option>
    <option value="venus">Sao Kim</option>
    <option value="earth">Trái Đất</option>
    <option value="mars">Sao Hỏa</option>
  </select>
  <button id="renderPlanetInfoButton">Đi</button>
</fieldset>

<div role="region" id="planetInfo" aria-live="polite">
  <h2 id="planetTitle">Chưa chọn hành tinh nào</h2>
  <p id="planetDescription">Chọn một hành tinh để xem mô tả của nó</p>
</div>

<p>
  <small>
    Thông tin từ
    <a href="https://en.wikipedia.org/wiki/Solar_System">Wikipedia</a>
  </small>
</p>
```

```js
const PLANETS_INFO = {
  mercury: {
    title: "Sao Thủy",
    description:
      "Sao Thủy là hành tinh nhỏ nhất và gần Mặt Trời nhất trong Hệ Mặt Trời. Nó được đặt theo tên vị thần Mercury của La Mã, sứ giả của các vị thần.",
  },

  venus: {
    title: "Sao Kim",
    description:
      "Sao Kim là hành tinh thứ hai tính từ Mặt Trời. Nó được đặt theo tên nữ thần tình yêu và sắc đẹp của La Mã.",
  },

  earth: {
    title: "Trái Đất",
    description:
      "Trái Đất là hành tinh thứ ba tính từ Mặt Trời và là vật thể duy nhất trong Vũ trụ được biết đến có sự sống.",
  },

  mars: {
    title: "Sao Hỏa",
    description:
      'Sao Hỏa là hành tinh thứ tư tính từ Mặt Trời và là hành tinh nhỏ thứ hai trong Hệ Mặt Trời sau Sao Thủy. Trong tiếng Anh, Mars mang tên vị thần chiến tranh của La Mã, và thường được gọi là "Hành tinh Đỏ".',
  },
};

function renderPlanetInfo(planet) {
  const planetTitle = document.querySelector("#planetTitle");
  const planetDescription = document.querySelector("#planetDescription");

  if (planet in PLANETS_INFO) {
    planetTitle.textContent = PLANETS_INFO[planet].title;
    planetDescription.textContent = PLANETS_INFO[planet].description;
  } else {
    planetTitle.textContent = "Chưa chọn hành tinh nào";
    planetDescription.textContent = "Chọn một hành tinh để xem mô tả của nó";
  }
}

const renderPlanetInfoButton = document.querySelector(
  "#renderPlanetInfoButton",
);

renderPlanetInfoButton.addEventListener("click", (event) => {
  const planetsSelect = document.querySelector("#planetsSelect");
  const selectedPlanet =
    planetsSelect.options[planetsSelect.selectedIndex].value;

  renderPlanetInfo(selectedPlanet);
});
```

{{EmbedLiveSample('Basic_example_Dropdown_box_updates_useful_onscreen_information', '', 350)}}

Khi người dùng chọn một hành tinh mới, thông tin trong vùng live sẽ được thông báo. Vì vùng live có `aria-live="polite"`, trình đọc màn hình sẽ đợi đến khi người dùng tạm dừng rồi mới thông báo cập nhật. Do đó, việc di chuyển trong danh sách và chọn một hành tinh khác sẽ không làm thông báo cập nhật trong vùng live. Chỉ hành tinh cuối cùng được chọn mới được thông báo.

Sau đây là ảnh chụp VoiceOver trên Mac thông báo cập nhật của vùng live (qua phụ đề):

![Ảnh chụp VoiceOver trên Mac thông báo cập nhật cho một vùng live. Phụ đề được hiển thị trong ảnh.](web_accessibility_aria_aria_live_regions.png)

## Vai trò có thuộc tính vùng live ngầm định

Các phần tử có các giá trị [`role="…"`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles) sau mặc định hoạt động như vùng live:

<table style="width: 100%;">
 <thead>
  <tr>
   <th scope="col">Vai trò</th>
   <th scope="col">Mô tả</th>
   <th scope="col">Ghi chú tương thích</th>
  </tr>
 </thead>
 <tbody>
  <tr>
   <td>log</td>
   <td>Nhật ký chat, lỗi, trò chơi hoặc loại nhật ký khác</td>
   <td>Để tăng tương thích, hãy thêm `aria-live="polite"` dư thừa khi dùng vai trò này.</td>
  </tr>
  <tr>
   <td>status</td>
   <td>Thanh trạng thái hoặc một vùng trên màn hình cung cấp trạng thái đã cập nhật của một thứ gì đó. Người dùng trình đọc màn hình có một lệnh đặc biệt để đọc trạng thái hiện tại.</td>
   <td>Để tăng tương thích, hãy thêm `aria-live="polite"` dư thừa khi dùng vai trò này.</td>
  </tr>
  <tr>
   <td>alert</td>
   <td>Thông báo lỗi hoặc cảnh báo nhấp nháy trên màn hình. Cảnh báo đặc biệt quan trọng đối với các thông báo xác thực phía máy khách cho người dùng. <a href="https://www.w3.org/WAI/ARIA/apg/example-index/alert/alert.html" class="external" rel="noopener">Ví dụ Alert.</a></td>
   <td>Để tăng tương thích, một số người khuyên nên thêm `aria-live="assertive"` dư thừa khi dùng vai trò này. Tuy nhiên, việc thêm cả `aria-live` và `role="alert"` sẽ gây lỗi đọc lặp đôi trong VoiceOver trên iOS.</td>
  </tr>
  <tr>
   <td>progressbar</td>
   <td>Một phần lai giữa widget và vùng live. Dùng với `aria-valuemin`, `aria-valuenow` và `aria-valuemax`. (TBD: thêm thông tin ở đây).</td>
   <td></td>
  </tr>
  <tr>
   <td>marquee</td>
   <td>Văn bản cuộn, chẳng hạn bảng giá cổ phiếu.</td>
   <td></td>
  </tr>
  <tr>
   <td>timer</td>
   <td>Bất kỳ loại bộ đếm thời gian hoặc đồng hồ nào, chẳng hạn bộ đếm ngược hoặc đồng hồ bấm giờ.</td>
   <td></td>
  </tr>
 </tbody>
</table>

## Thuộc tính vùng live bổ sung

Các vùng live được hỗ trợ khá tốt. Năm 2014, Vispero đã đăng [thông tin về tình trạng hỗ trợ của Live Regions](https://vispero.com/resources/screen-reader-support-aria-live-regions/). Paul J. Adam đã nghiên cứu đặc biệt về sự hỗ trợ của `aria-atomic` và `aria-relevant`.

1. **`aria-atomic`**: `aria-atomic=BOOLEAN` được dùng để đặt xem trình đọc màn hình có nên luôn trình bày toàn bộ vùng live hay không, kể cả khi chỉ một phần của vùng thay đổi. Các giá trị có thể là: `false` hoặc `true`. Giá trị mặc định là `false`.
2. [**`aria-relevant`**](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-relevant)

   : `aria-relevant=[LIST_OF_CHANGES]` được dùng để đặt những kiểu thay đổi nào là có liên quan đến vùng live. Các giá trị có thể là một hoặc nhiều hơn trong số: `additions`, `removals`, `text`, `all`. Giá trị mặc định là: `additions text`.

### Ví dụ cơ bản: `aria-atomic`

Để minh họa `aria-atomic`, hãy xét một website có đồng hồ cơ bản hiển thị giờ và phút. Đồng hồ được cập nhật mỗi phút, với thời gian mới ghi đè nội dung hiện tại.

```html
<div id="clock" role="timer" aria-live="polite">
  <span id="clock-hours"></span>
  <span id="clock-mins"></span>
</div>
```

```js
/* JavaScript cơ bản để cập nhật đồng hồ */
function updateClock() {
  const now = new Date();
  document.getElementById("clock-hours").textContent = now.getHours();
  document.getElementById("clock-mins").textContent =
    `0${now.getMinutes()}`.slice(-2);
}

/* chạy lần đầu */
updateClock();

/* cập nhật mỗi phút */
setInterval(updateClock, 60000);
```

Lần đầu tiên hàm chạy, toàn bộ chuỗi được thêm vào sẽ được thông báo. Ở các lần gọi sau, chỉ những phần nội dung thay đổi so với nội dung trước đó mới được thông báo. Ví dụ, khi đồng hồ đổi từ "17:33" sang "17:34", công nghệ trợ năng sẽ chỉ thông báo "34", điều này sẽ không thực sự hữu ích với người dùng.

Một cách khắc phục là trước hết xóa sạch toàn bộ nội dung của vùng live (trong trường hợp này, đặt `innerHTML` của cả `<span id="clock-hours">` và `<span id="clock-mins">` thành rỗng), rồi mới chèn nội dung mới. Tuy nhiên, cách này đôi khi không đáng tin cậy, vì nó phụ thuộc vào thời điểm chính xác của hai bản cập nhật này.

`aria-atomic="true"` bảo đảm rằng mỗi lần vùng live được cập nhật, toàn bộ nội dung sẽ được thông báo đầy đủ (ví dụ: "17:34").

```html
<div id="clock" role="timer" aria-live="polite" aria-atomic="true">…</div>
```

Một ví dụ khác về `aria-atomic` - một cập nhật/thông báo được tạo ra do hành động của người dùng.

```html
<div id="date-input">
  <label for="year">Năm:</label>
  <input type="text" id="year" value="1990" />
</div>

<div id="date-output" aria-atomic="true" aria-live="polite">
  Năm đã chọn là:
  <span id="year-output">1990</span>
</div>
```

```js
function change(event) {
  const yearOut = document.getElementById("year-output");

  switch (event.target.id) {
    case "year":
      yearOut.textContent = event.target.value;
      break;
  }
}

document.getElementById("year").addEventListener("blur", change);
```

Không có `aria-atomic="true"`, trình đọc màn hình chỉ thông báo giá trị năm đã thay đổi. Với `aria-atomic="true"`, trình đọc màn hình sẽ thông báo "Năm đã chọn là: _giá trị đã thay đổi_"

### Ví dụ cơ bản: `aria-relevant`

Với `aria-relevant`, bạn có thể chỉ định kiểu thay đổi/cập nhật nào của một vùng live nên được thông báo.

Ví dụ, hãy xét một website chat muốn hiển thị danh sách người dùng hiện đang đăng nhập. Thay vì chỉ thông báo những người đang đăng nhập, ta cũng muốn kích hoạt thông báo khi một người dùng bị _gỡ_ khỏi danh sách. Ta có thể làm điều này bằng cách chỉ định `aria-relevant="additions removals"`.

```html
<ul id="roster" aria-live="polite" aria-relevant="additions removals">
  <!-- dùng JavaScript để thêm và xóa người dùng ở đây -->
</ul>
```

Phân tích các thuộc tính live của ARIA:

- `aria-live="polite"` cho biết trình đọc màn hình nên đợi đến khi người dùng rảnh rồi mới trình bày cập nhật. Đây là giá trị thường được dùng nhất, vì việc ngắt người dùng bằng "assertive" có thể làm gián đoạn luồng làm việc của họ.
- `aria-atomic` không được đặt (`false` theo mặc định) để chỉ người dùng được thêm hoặc xóa mới được đọc, chứ không phải toàn bộ danh sách mỗi lần.
- `aria-relevant="additions removals"` bảo đảm cả người dùng được thêm và bị gỡ khỏi danh sách đều sẽ được đọc.

## Xem thêm
