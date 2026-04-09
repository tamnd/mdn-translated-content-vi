---
title: "CycleTracker: Chức năng JavaScript"
short-title: Chức năng JavaScript
slug: Web/Progressive_web_apps/Tutorials/CycleTracker/JavaScript_functionality
page-type: tutorial-chapter
sidebar: pwasidebar
---

{{PreviousMenuNext("Web/Progressive_web_apps/Tutorials/CycleTracker/Secure_connection", "Web/Progressive_web_apps/Tutorials/CycleTracker", "Web/Progressive_web_apps/Tutorials/CycleTracker")}}

Ở phần trước, chúng ta đã viết HTML và CSS cho CycleTracker, tạo ra phiên bản tĩnh của web app. Trong phần này, chúng ta sẽ viết JavaScript cần thiết để biến HTML tĩnh thành một ứng dụng web hoạt động đầy đủ.

Nếu bạn chưa làm, hãy sao chép [HTML](https://github.com/mdn/pwa-examples/blob/main/cycletracker/javascript_functionality/index.html) và [CSS](https://github.com/mdn/pwa-examples/blob/main/cycletracker/javascript_functionality/style.css) rồi lưu chúng thành các file `index.html` và `style.css`.

Dòng cuối cùng trong file HTML gọi file JavaScript `app.js`. Đây là script mà chúng ta tạo trong phần này. Trong bài học này, chúng ta sẽ viết mã JavaScript chạy phía client để bắt các lần gửi form, lưu dữ liệu gửi cục bộ, và điền nội dung vào phần past-periods.

Kết thúc bài học, bạn sẽ có một ứng dụng hoạt động đầy đủ. Ở các bài học sau, chúng ta sẽ nâng cấp dần ứng dụng để tạo thành một PWA có thể cài đặt và vẫn hoạt động ngay cả khi người dùng ngoại tuyến.

## Nhiệm vụ JavaScript

Khi người dùng truy cập trang, chúng ta kiểm tra xem họ đã có dữ liệu lưu trong local storage hay chưa. Lần đầu người dùng truy cập trang sẽ chưa có dữ liệu. Khi người dùng mới chọn hai ngày và gửi form, chúng ta cần:

1. Tạo tiêu đề `<h2>Past periods</h2>`
2. Tạo một {{HTMLelement("ul")}}
3. Điền `<ul>` bằng một {{HTMLelement("li")}} chứa thông tin về chu kỳ đó
4. Lưu dữ liệu vào local storage

Với mỗi lần gửi form tiếp theo, chúng ta cần:

1. Thêm chu kỳ kinh nguyệt mới vào danh sách hiện tại
2. Sắp xếp danh sách theo thứ tự ngày
3. Điền lại `<ul>` bằng danh sách mới, mỗi chu kỳ một `<li>`
4. Ghi thêm dữ liệu vào local storage đã lưu

Người dùng đã có dữ liệu trước đó sẽ có dữ liệu trong local storage. Khi người dùng quay lại trang web của chúng ta bằng cùng trình duyệt trên cùng thiết bị, chúng ta cần:

1. Lấy dữ liệu từ local storage
2. Tạo tiêu đề `<h2>Past periods</h2>`
3. Tạo một {{HTMLelement("ul")}}
4. Điền `<ul>` bằng một {{HTMLelement("li")}} cho mỗi chu kỳ kinh nguyệt đã lưu trong local storage.

Đây là một ứng dụng minh họa cho người mới bắt đầu. Mục tiêu là dạy những điều cơ bản của việc chuyển một web app thành PWA. Ứng dụng này chưa có các tính năng cần thiết như xác thực form, kiểm tra lỗi, chỉnh sửa hay xóa, v.v. Bạn hoàn toàn có thể mở rộng các tính năng đã có và điều chỉnh bài học cũng như ứng dụng theo mục tiêu học tập và nhu cầu thực tế của mình.

## Gửi form

Trang có một {{HTMLelement("form")}} với bộ chọn ngày để chọn ngày bắt đầu và ngày kết thúc của mỗi chu kỳ kinh nguyệt. Các bộ chọn ngày là {{HTMLElement("input")}} kiểu {{HTMLElement("input/date", "date")}} với [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) lần lượt là `start-date` và `end-date`.

Form không có method hay action. Thay vào đó, chúng ta thêm một trình nghe sự kiện bằng [`addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener) cho form. Khi người dùng cố gửi form, chúng ta chặn việc gửi form, lưu chu kỳ mới, hiển thị chu kỳ này cùng với các chu kỳ trước đó, rồi reset form.

```js
// create constants for the form and the form controls
const newPeriodFormEl = document.getElementsByTagName("form")[0];
const startDateInputEl = document.getElementById("start-date");
const endDateInputEl = document.getElementById("end-date");

// Listen to form submissions.
newPeriodFormEl.addEventListener("submit", (event) => {
  // Prevent the form from submitting to the server
  // since everything is client-side.
  event.preventDefault();

  // Get the start and end dates from the form.
  const startDate = startDateInputEl.value;
  const endDate = endDateInputEl.value;

  // Check if the dates are invalid
  if (checkDatesInvalid(startDate, endDate)) {
    // If the dates are invalid, exit.
    return;
  }

  // Store the new period in our client-side storage.
  storeNewPeriod(startDate, endDate);

  // Refresh the UI.
  renderPastPeriods();

  // Reset the form.
  newPeriodFormEl.reset();
});
```

Sau khi chặn việc gửi form bằng [`preventDefault()`](/en-US/docs/Web/API/Event/preventDefault), chúng ta:

1. [Kiểm tra dữ liệu người dùng](#validate_user_input); thoát nếu không hợp lệ,
2. lưu chu kỳ mới bằng cách [lấy, phân tích, thêm, sắp xếp, chuyển thành chuỗi và lưu lại](#retrieve_append_sort_and_re-store_data) dữ liệu trong localStorage,
3. [hiển thị dữ liệu form](#render_data_to_screen) cùng với dữ liệu các chu kỳ kinh nguyệt trước đó và tiêu đề phần, và
4. reset form bằng phương thức [`reset()`](/en-US/docs/Web/API/HTMLFormElement/reset) của HTMLFormElement

### Kiểm tra dữ liệu người dùng

Chúng ta kiểm tra xem ngày có không hợp lệ hay không. Việc kiểm tra lỗi ở mức tối thiểu. Chúng ta đảm bảo cả hai ngày đều không phải null, điều mà thuộc tính `required` lẽ ra phải ngăn chặn. Chúng ta cũng kiểm tra ngày bắt đầu không lớn hơn ngày kết thúc. Nếu có lỗi, chúng ta xóa form.

```js
function checkDatesInvalid(startDate, endDate) {
  // Check that end date is after start date and neither is null.
  if (!startDate || !endDate || startDate > endDate) {
    // To make the validation robust we could:
    // 1. add error messaging based on error type
    // 2. Alert assistive technology users about the error
    // 3. move focus to the error location
    // instead, for now, we clear the dates if either
    // or both are invalid
    newPeriodFormEl.reset();
    // as dates are invalid, we return true
    return true;
  }
  // else
  return false;
}
```

Trong phiên bản mạnh mẽ hơn của ứng dụng này, tối thiểu chúng ta sẽ thêm thông báo lỗi để báo cho người dùng biết có lỗi. Một ứng dụng tốt sẽ nói rõ lỗi là gì, đưa focus tới điều khiển form có vấn đề, và dùng [ARIA live regions](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions) để cảnh báo người dùng công nghệ hỗ trợ về lỗi đó.

## Local storage

Chúng ta đang dùng [Web Storage API](/en-US/docs/Web/API/Web_Storage_API), cụ thể là [window.localStorage](/en-US/docs/Web/API/Window/localStorage), để lưu các cặp ngày bắt đầu và ngày kết thúc dưới dạng chuỗi JSON.

[LocalStorage](/en-US/docs/Learn_web_development/Extensions/Client-side_APIs/Client-side_storage#storing_simple_data_—_web_storage) có một số giới hạn, nhưng vẫn đủ cho nhu cầu của ứng dụng. Chúng ta dùng localStorage để giữ cho giải pháp đơn giản và chỉ chạy phía client. Điều này có nghĩa dữ liệu chỉ được lưu trên một trình duyệt ở một thiết bị. Xóa dữ liệu trình duyệt cũng sẽ làm mất toàn bộ các chu kỳ đã lưu cục bộ. Điều có vẻ là hạn chế với nhiều ứng dụng có thể lại là lợi thế ở trường hợp này, vì dữ liệu chu kỳ kinh nguyệt là dữ liệu cá nhân, và người dùng có thể rất chính đáng khi lo ngại về quyền riêng tư.

Với ứng dụng mạnh mẽ hơn, các lựa chọn [lưu trữ phía client](/en-US/docs/Learn_web_development/Extensions/Client-side_APIs/Client-side_storage) khác như [IndexedDB](/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB) (IDB) và, như sẽ bàn sau, service worker, có hiệu năng tốt hơn.

Hạn chế của `localStorage` bao gồm:

- Dung lượng dữ liệu giới hạn: `localStorage` chỉ có 5MB dữ liệu cho mỗi origin. Nhu cầu lưu trữ của chúng ta nhỏ hơn nhiều so với mức đó.
- Chỉ lưu chuỗi: `localStorage` lưu dữ liệu theo cặp khóa chuỗi và giá trị chuỗi. Ngày bắt đầu và ngày kết thúc của chúng ta sẽ được lưu dưới dạng một đối tượng JSON được chuyển thành chuỗi. Với dữ liệu phức tạp hơn, sẽ cần một cơ chế lưu trữ mạnh mẽ hơn như IDB.
- Có thể gây hiệu năng kém: việc đọc và ghi vào local storage diễn ra đồng bộ trên luồng chính. Khi luồng chính bận, ứng dụng sẽ không phản hồi và trông như bị treo. Với tính chất hạn chế của ứng dụng này, cú sụt trải nghiệm đó là không đáng kể.
- Chỉ có ở luồng chính: ngoài vấn đề hiệu năng do chiếm dụng luồng chính, service worker không có quyền truy cập vào luồng chính, nghĩa là service worker không thể trực tiếp đọc hay ghi dữ liệu local storage.

### Lấy, thêm, sắp xếp và lưu lại dữ liệu

Vì chúng ta dùng localStorage, vốn chỉ gồm một chuỗi duy nhất, nên chúng ta lấy chuỗi JSON dữ liệu từ local storage, phân tích dữ liệu JSON (nếu có), thêm cặp ngày mới vào mảng hiện có, sắp xếp các ngày, chuyển đối tượng JSON trở lại thành chuỗi, rồi lưu chuỗi đó lại vào `localStorage`.

Quy trình này cần tạo ra một vài hàm:

```js
// Add the storage key as an app-wide constant
const STORAGE_KEY = "period-tracker";

function storeNewPeriod(startDate, endDate) {
  // Get data from storage.
  const periods = getAllStoredPeriods();

  // Add the new period object to the end of the array of period objects.
  periods.push({ startDate, endDate });

  // Sort the array so that periods are ordered by start date, from newest
  // to oldest.
  periods.sort((a, b) => new Date(b.startDate) - new Date(a.startDate));

  // Store the updated array back in the storage.
  window.localStorage.setItem(STORAGE_KEY, JSON.stringify(periods));
}

function getAllStoredPeriods() {
  // Get the string of period data from localStorage
  const data = window.localStorage.getItem(STORAGE_KEY);

  // If no periods were stored, default to an empty array
  // otherwise, return the stored data as parsed JSON
  const periods = data ? JSON.parse(data) : [];

  return periods;
}
```

## Hiển thị dữ liệu lên màn hình

Bước cuối cùng của ứng dụng là hiển thị danh sách các chu kỳ trước đó cùng với một tiêu đề.

Trong HTML, chúng ta đã thêm một placeholder `<section id="past-periods">` để chứa tiêu đề và danh sách các chu kỳ trước đó.

Thêm phần tử chứa vào danh sách biến ở đầu script.

```js
const pastPeriodContainer = document.getElementById("past-periods");
```

Chúng ta lấy chuỗi đã phân tích của các chu kỳ trước đó, hoặc một mảng rỗng. Nếu rỗng, chúng ta thoát. Nếu có chu kỳ trước đó, chúng ta xóa nội dung hiện tại khỏi khung chứa chu kỳ cũ. Chúng ta tạo một tiêu đề và một danh sách không thứ tự. Chúng ta lặp qua các chu kỳ trước đó, thêm các mục danh sách chứa ngày bắt đầu và ngày kết thúc đã được định dạng.

```js
function renderPastPeriods() {
  // get the parsed string of periods, or an empty array.
  const periods = getAllStoredPeriods();

  // exit if there are no periods
  if (periods.length === 0) {
    return;
  }

  // Clear the list of past periods, since we're going to re-render it.
  pastPeriodContainer.textContent = "";

  const pastPeriodHeader = document.createElement("h2");
  pastPeriodHeader.textContent = "Past periods";

  const pastPeriodList = document.createElement("ul");

  // Loop over all periods and render them.
  periods.forEach((period) => {
    const periodEl = document.createElement("li");
    periodEl.textContent = `From ${formatDate(
      period.startDate,
    )} to ${formatDate(period.endDate)}`;
    pastPeriodList.appendChild(periodEl);
  });

  pastPeriodContainer.appendChild(pastPeriodHeader);
  pastPeriodContainer.appendChild(pastPeriodList);
}

function formatDate(dateString) {
  // Convert the date string to a Date object.
  const date = new Date(dateString);

  // Format the date into a locale-specific string.
  // include your locale for better user experience
  return date.toLocaleDateString("en-US", { timeZone: "UTC" });
}
```

### Hiển thị chu kỳ đã lưu khi tải trang

Khi JavaScript đã được hoãn chạy và trang được tải, chúng ta hiển thị các chu kỳ trước đó, nếu có.

```js
// Start the app by rendering the past periods.
renderPastPeriods();
```

## JavaScript hoàn chỉnh

File `app.js` của bạn sẽ trông gần giống đoạn JavaScript sau:

```js
const newPeriodFormEl = document.getElementsByTagName("form")[0];
const startDateInputEl = document.getElementById("start-date");
const endDateInputEl = document.getElementById("end-date");
const pastPeriodContainer = document.getElementById("past-periods");

// Add the storage key as an app-wide constant
const STORAGE_KEY = "period-tracker";

// Listen to form submissions.
newPeriodFormEl.addEventListener("submit", (event) => {
  event.preventDefault();
  const startDate = startDateInputEl.value;
  const endDate = endDateInputEl.value;
  if (checkDatesInvalid(startDate, endDate)) {
    return;
  }
  storeNewPeriod(startDate, endDate);
  renderPastPeriods();
  newPeriodFormEl.reset();
});

function checkDatesInvalid(startDate, endDate) {
  if (!startDate || !endDate || startDate > endDate) {
    newPeriodFormEl.reset();
    return true;
  }
  return false;
}

function storeNewPeriod(startDate, endDate) {
  const periods = getAllStoredPeriods();
  periods.push({ startDate, endDate });
  periods.sort((a, b) => new Date(b.startDate) - new Date(a.startDate));
  window.localStorage.setItem(STORAGE_KEY, JSON.stringify(periods));
}

function getAllStoredPeriods() {
  const data = window.localStorage.getItem(STORAGE_KEY);
  const periods = data ? JSON.parse(data) : [];
  console.dir(periods);
  console.log(periods);
  return periods;
}

function renderPastPeriods() {
  const pastPeriodHeader = document.createElement("h2");
  const pastPeriodList = document.createElement("ul");
  const periods = getAllStoredPeriods();
  if (periods.length === 0) {
    return;
  }
  pastPeriodContainer.textContent = "";
  pastPeriodHeader.textContent = "Past periods";
  periods.forEach((period) => {
    const periodEl = document.createElement("li");
    periodEl.textContent = `From ${formatDate(
      period.startDate,
    )} to ${formatDate(period.endDate)}`;
    pastPeriodList.appendChild(periodEl);
  });

  pastPeriodContainer.appendChild(pastPeriodHeader);
  pastPeriodContainer.appendChild(pastPeriodList);
}

function formatDate(dateString) {
  const date = new Date(dateString);
  return date.toLocaleDateString("en-US", { timeZone: "UTC" });
}

renderPastPeriods();
```

Bạn có thể thử [ứng dụng web theo dõi chu kỳ CycleTracker hoàn chỉnh](https://mdn.github.io/pwa-examples/cycletracker/javascript_functionality/) và xem [mã nguồn web app](https://github.com/mdn/pwa-examples/tree/main/cycletracker/javascript_functionality) trên GitHub. Đúng là nó hoạt động, nhưng vẫn chưa phải là PWA.

## Bước tiếp theo

Về cốt lõi, một PWA là một ứng dụng web có thể cài đặt và được nâng cấp dần để hoạt động ngoại tuyến. Giờ khi đã có một ứng dụng web đầy đủ chức năng, chúng ta sẽ thêm các tính năng cần thiết để biến nó thành PWA, gồm [manifest file](/en-US/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/Manifest_file), [kết nối an toàn](/en-US/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/Secure_connection) và [service worker](/en-US/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/Service_workers).

Trước tiên, chúng ta tạo [manifest file của CycleTracker](/en-US/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/Manifest_file), bao gồm danh tính, diện mạo và biểu tượng cho PWA CycleTracker của chúng ta.

{{PreviousMenuNext("Web/Progressive_web_apps/Tutorials/CycleTracker/HTML_and_CSS", "Web/Progressive_web_apps/Tutorials/CycleTracker/Manifest_file", "Web/Progressive_web_apps/Tutorials/CycleTracker")}}
