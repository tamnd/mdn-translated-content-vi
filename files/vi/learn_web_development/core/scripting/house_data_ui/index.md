---
title: "Thử thách: Xây dựng giao diện dữ liệu nhà"
short-title: "Thử thách: Giao diện dữ liệu nhà"
slug: Learn_web_development/Core/Scripting/House_data_UI
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Test_your_skills/JSON", "Learn_web_development/Core/Scripting/Debugging_JavaScript", "Learn_web_development/Core/Scripting")}}

Trong thử thách này, chúng ta sẽ yêu cầu bạn viết một số JavaScript cho trang tìm kiếm/lọc nhà trên trang web bất động sản. Điều này sẽ bao gồm tải dữ liệu JSON, lọc dữ liệu đó dựa trên các giá trị được nhập vào các điều khiển biểu mẫu được cung cấp và hiển thị dữ liệu đó lên giao diện. Trong quá trình thực hiện, chúng ta cũng sẽ kiểm tra kiến thức của bạn về câu lệnh điều kiện, vòng lặp, mảng và các phương thức mảng, v.v.

## Điểm khởi đầu

Để bắt đầu, hãy nhấp nút **Play** trong một trong các panel mã dưới đây để mở ví dụ được cung cấp trong MDN Playground. Sau đó bạn sẽ làm theo các hướng dẫn trong phần [Tóm tắt dự án](#project_brief) để hoàn thành chức năng JavaScript.

```html live-sample___house-ui-start live-sample___house-ui-finish
<h1>House search</h1>
<p>
  Search for houses for sale. You can filter your search by street, number of
  bedrooms, and number of bathrooms, or just submit the search with no filters
  to display all available properties.
</p>
<form>
  <div>
    <label for="choose-street">Street:</label>
    <select id="choose-street" name="choose-street">
      <option value="">No street selected</option>
    </select>
  </div>
  <div>
    <label for="choose-bedrooms">Number of bedrooms:</label>
    <select id="choose-bedrooms" name="choose-bedrooms">
      <option value="">Any number of bedrooms</option>
    </select>
  </div>
  <div>
    <label for="choose-bathrooms">Number of bathrooms:</label>
    <select id="choose-bathrooms" name="choose-bathrooms">
      <option value="">Any number of bathrooms</option>
    </select>
  </div>
  <div>
    <button>Search for houses</button>
  </div>
</form>
<p id="result-count">Results returned: 0</p>
<section id="output"></section>
```

```css hidden live-sample___house-ui-start live-sample___house-ui-finish
body {
  font: 1.1em / 1.5 system-ui;
  width: clamp(480px, 90%, 1200px);
  margin: 0 auto;
}

h1 {
  font-size: 1.5em;
}

h2 {
  font-size: 1.3em;
}

form div {
  display: flex;
  width: 100%;
  max-width: 500px;
  align-items: center;
  margin-bottom: 20px;
}

label[for],
select {
  flex: 1;
}

#output {
  display: flex;
  flex-flow: row wrap;
  justify-content: center;
  gap: 50px;
}

#output article {
  padding: 0 20px;
  background-color: #efefef;
  border: 2px solid #cccccc;
  border-radius: 10px;
}

#output ul {
  list-style-type: none;
  padding-left: 0;
}
```

```js-nolint live-sample___house-ui-start
const streetSelect = document.getElementById("choose-street");
const bedroomSelect = document.getElementById("choose-bedrooms");
const bathroomSelect = document.getElementById("choose-bathrooms");
const form = document.querySelector("form");

const resultCount = document.getElementById("result-count");
const output = document.getElementById("output");

let houses;

function initializeForm() {

}

function renderHouses(e) {
  // Stop the form submitting
  e.preventDefault();

  // Add rest of code here
}

// Add a submit listener to the <form> element
form.addEventListener("submit", renderHouses);

// Call fetchHouseData() to initialize the app
fetchHouseData();
```

{{EmbedLiveSample("house-ui-start", "100%", 400)}}

## Tóm tắt dự án

Bạn được cung cấp trang HTML index chứa biểu mẫu cho phép người dùng tìm kiếm nhà theo phố, số phòng ngủ và số phòng tắm, cộng với một vài phần tử để chứa kết quả tìm kiếm. Bạn cũng được cung cấp tệp JavaScript chứa một số định nghĩa hằng số và biến, cộng với một vài định nghĩa hàm khung. Công việc của bạn là điền vào JavaScript còn thiếu để làm cho giao diện tìm kiếm nhà hoạt động.

Các định nghĩa hằng số và biến được cung cấp giữ các tham chiếu sau:

- `streetSelect`: Phần tử `<select>` "choose-street".
- `bedroomSelect`: Phần tử `<select>` "choose-bedrooms".
- `bathroomSelect`: Phần tử `<select>` "choose-bathrooms".
- `form`: Phần tử `<form>` tổng thể chứa các phần tử `<select>`.
- `resultCount`: Phần tử `<p>` "result-count", cập nhật để hiển thị số kết quả được trả về sau mỗi lần tìm kiếm.
- `output`: Phần tử `<section>` "output", hiển thị kết quả tìm kiếm.
- `houses`: Ban đầu rỗng, nhưng điều này sẽ chứa đối tượng dữ liệu nhà được tạo bằng cách phân tích dữ liệu JSON đã tải về.

Các hàm khung là:

- `initializeForm()`: Điều này sẽ truy vấn dữ liệu và điền vào các phần tử `<select>` với các giá trị có thể được tìm kiếm.
- `renderHouses()`: Điều này sẽ lọc dữ liệu dựa trên các giá trị phần tử `<select>` và hiển thị kết quả.

### Tải dữ liệu

Điều đầu tiên bạn cần làm là tạo hàm mới để tải dữ liệu nhà và lưu vào biến `houses`.

Để làm điều đó:

1. Tạo hàm mới ngay bên dưới các định nghĩa biến và hằng số gọi là `fetchHouseData()`.
2. Bên trong thân hàm, sử dụng phương thức `fetch()` để tải JSON tìm thấy tại [https://mdn.github.io/shared-assets/misc/houses.json](https://mdn.github.io/shared-assets/misc/houses.json). Bạn nên nghiên cứu cấu trúc của dữ liệu này để chuẩn bị cho một số bước sau.
3. Khi promise kết quả giải quyết, kiểm tra thuộc tính `ok` của phản hồi. Nếu nó là `false`, ném lỗi tùy chỉnh báo cáo `status` của phản hồi.
4. Với điều kiện phản hồi ổn, trả về phản hồi dưới dạng JSON bằng phương thức `json()`.
5. Khi promise kết quả giải quyết, đặt biến `houses` bằng kết quả của phương thức `json()` (đây nên là mảng các đối tượng chứa dữ liệu nhà), và gọi hàm `initializeForm()`.

### Hoàn thành hàm `initializeForm()`

Bây giờ bạn cần viết nội dung của hàm `initializeForm()`. Điều này sẽ truy vấn dữ liệu được lưu bên trong `houses` và sử dụng nó để điền vào các phần tử `<select>` với các phần tử `<option>` đại diện cho tất cả các giá trị khác nhau có thể được lọc. Hiện tại, các phần tử `<select>` chỉ chứa một phần tử `<option>` duy nhất với giá trị `""` (chuỗi rỗng), đại diện cho tất cả các giá trị. Người dùng có thể chọn tùy chọn này nếu họ không muốn kết quả được lọc theo trường đó.

Bên trong thân hàm, viết mã thực hiện như sau:

1. Tạo các phần tử `<option>` cho tất cả các tên phố khác nhau bên trong `<select>` "choose-street". Có một vài cách bạn có thể làm điều này, nhưng chúng tôi khuyên bạn tạo mảng tạm thời sau đó lặp qua tất cả các đối tượng bên trong `houses`. Bên trong vòng lặp, kiểm tra xem mảng tạm thời có bao gồm thuộc tính `street` của nhà hiện tại không. Nếu không, thêm nó vào mảng tạm thời và thêm `<option>` vào `<select>` "choose-street" bao gồm thuộc tính `street` làm giá trị của nó.
2. Tạo các tùy chọn cho tất cả các giá trị số phòng ngủ có thể bên trong `<select>` "choose-bedrooms". Để làm điều này, bạn có thể lặp qua mảng `houses` và xác định giá trị `bedrooms` lớn nhất là gì, sau đó viết vòng lặp thứ hai thêm `<option>` vào `<select>` "choose-bedrooms" cho mỗi số từ `1` đến giá trị lớn nhất đó.
3. Tạo các tùy chọn cho tất cả các giá trị số phòng tắm có thể bên trong `<select>` "choose-bathrooms". Điều này có thể được giải quyết bằng kỹ thuật tương tự như bước trước.

> [!NOTE]
> Bạn _có thể_ chỉ cần mã hóa cứng các phần tử `<option>` bên trong HTML, nhưng điều đó chỉ hoạt động cho tập dữ liệu chính xác này. Chúng ta muốn bạn viết JavaScript sẽ điền chính xác biểu mẫu bất kể các giá trị dữ liệu được cung cấp (mỗi đối tượng nhà phải có cùng cấu trúc).

> [!NOTE]
> Bạn có thể sử dụng thuộc tính `innerHTML` để thêm nội dung con bên trong các phần tử HTML, nhưng chúng tôi khuyên bạn không làm như vậy. Bạn không thể luôn tin tưởng dữ liệu bạn đang thêm vào trang của mình: Nếu không được làm sạch đúng cách trên máy chủ, những kẻ xấu có thể sử dụng `innerHTML` như một con đường để thực hiện các cuộc tấn công [Cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) trên trang của bạn. Con đường an toàn hơn là sử dụng các tính năng DOM scripting như `createElement()`, `appendChild()` và `textContent`. Sử dụng `innerHTML` để xóa nội dung con không phải là vấn đề như vậy.

### Hoàn thành hàm `renderHouses()`

Tiếp theo, bạn cần hoàn thành thân hàm `renderHouses()`. Điều này sẽ lọc dữ liệu dựa trên các giá trị phần tử `<select>` và hiển thị kết quả lên giao diện.

1. Trước tiên, bạn cần lọc dữ liệu. Điều này có thể đạt được tốt nhất bằng cách sử dụng phương thức `filter()` của mảng, trả về mảng mới chỉ chứa các phần tử mảng khớp với tiêu chí lọc.
   1. Đây là hàm `filter()` khá phức tạp để viết. Bạn cần kiểm tra xem thuộc tính `street` của nhà có bằng giá trị được chọn của `<select>` "choose-street", và thuộc tính `bedrooms` của nhà có bằng giá trị được chọn của `<select>` "choose-bedrooms", và thuộc tính `bathrooms` của nhà có bằng giá trị được chọn của `<select>` "choose-bathrooms".
   2. Mỗi thành phần của kiểm tra luôn cần trả về `true` nếu giá trị `<select>` liên kết là `""` (chuỗi rỗng, đại diện cho tất cả các giá trị). Bạn có thể đạt được điều này bằng cách "ngắn mạch" mỗi lần kiểm tra.
   3. Bạn cũng cần đảm bảo các kiểu dữ liệu khớp trong mỗi lần kiểm tra. Giá trị của phần tử biểu mẫu luôn là chuỗi. Đây không nhất thiết là trường hợp cho các giá trị thuộc tính đối tượng của bạn. Làm thế nào để các kiểu dữ liệu khớp cho mục đích kiểm tra?
2. Xuất số kết quả tìm kiếm được lọc vào phần tử `<p>` "result-count", sử dụng cấu trúc chuỗi "Results returned: number".
3. Làm trống phần tử `<section>` "output", vì vậy nó không có bất kỳ phần tử HTML con nào. Nếu bạn không làm điều này, mỗi khi tìm kiếm được thực hiện kết quả sẽ được thêm vào cuối kết quả trước đó thay vì thay thế chúng.
4. Tạo hàm mới bên trong `renderHouses()` gọi là `renderHouse()`. Hàm này cần lấy đối tượng nhà làm đối số và thực hiện hai điều:
   1. Tính tổng diện tích của các phòng bên trong đối tượng `room_sizes` của nhà. Điều này không đơn giản như lặp qua mảng số và cộng tổng chúng, nhưng không quá khó.
   2. Thêm phần tử `<article>` bên trong phần tử `<section>` "output" chứa số nhà, tên phố, số phòng ngủ và phòng tắm, tổng diện tích phòng và giá. Bạn có thể thay đổi cấu trúc nếu muốn, chúng tôi muốn nó tương tự như đoạn HTML này:
   ```html
   <article>
     <h2>number street name</h2>
     <ul>
       <li>🛏️ Bedrooms: number</li>
       <li>🛀 Bathrooms: number</li>
       <li>Room area: number m²</li>
       <li>Price: £price</li>
     </ul>
   </article>
   ```
5. Lặp qua tất cả các nhà bên trong mảng đã lọc và truyền mỗi cái vào lời gọi `renderHouse()`.

## Gợi ý và mẹo

- Bạn không cần thay đổi HTML hoặc CSS theo bất kỳ cách nào.
- Để làm những việc như tìm giá trị lớn nhất trong mảng giá trị, hàm mảng `reduce()` thực sự tiện dụng. Chúng ta chưa dạy nó trong khóa học này, vì nó khá phức tạp, nhưng nó thực sự mạnh mẽ khi bạn hiểu được nó. Như mục tiêu mở rộng, hãy thử nghiên cứu và sử dụng nó trong câu trả lời của bạn.

## Ví dụ

Ứng dụng hoàn chỉnh của bạn sẽ hoạt động như ví dụ trực tiếp sau:

{{EmbedLiveSample("house-ui-finish", "100%", 700)}}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh sẽ trông giống như thế này:

```js live-sample___house-ui-finish
const streetSelect = document.getElementById("choose-street");
const bedroomSelect = document.getElementById("choose-bedrooms");
const bathroomSelect = document.getElementById("choose-bathrooms");
const form = document.querySelector("form");
const resultCount = document.getElementById("result-count");
const output = document.getElementById("output");

let houses;

// Solution: Fetching the data

function fetchHouseData() {
  fetch("https://mdn.github.io/shared-assets/misc/houses.json")
    .then((response) => {
      if (!response.ok) {
        throw new Error(`HTTP error: ${response.status}`);
      }

      return response.json();
    })
    .then((json) => {
      houses = json;
      initializeForm();
    });
}

// Solution: Completing the initializeForm() function

function initializeForm() {
  // Create options for all the different street names
  const streetArray = [];
  for (let house of houses) {
    if (!streetArray.includes(house.street)) {
      streetArray.push(house.street);
      streetSelect.appendChild(document.createElement("option")).textContent =
        house.street;
    }
  }

  // Create options for all the possible bedroom values
  const largestBedrooms = houses.reduce(
    (largest, house) => (house.bedrooms > largest ? house.bedrooms : largest),
    houses[0].bedrooms,
  );
  let i = 1;
  while (i <= largestBedrooms) {
    bedroomSelect.appendChild(document.createElement("option")).textContent = i;
    i++;
  }

  // Create options for all the possible bathroom values
  const largestBathrooms = houses.reduce(
    (largest, house) => (house.bathrooms > largest ? house.bathrooms : largest),
    houses[0].bathrooms,
  );
  let j = 1;
  while (j <= largestBathrooms) {
    bathroomSelect.appendChild(document.createElement("option")).textContent =
      j;
    j++;
  }
}

// Solution: Completing the renderHouses() function

function renderHouses(e) {
  // Stop the form submitting
  e.preventDefault();

  // Filter the data
  const filteredHouses = houses.filter((house) => {
    // prettier-ignore
    const test = (streetSelect.value === "" ||
                  house.street === streetSelect.value) &&
                 (bedroomSelect.value === "" ||
                  String(house.bedrooms) === bedroomSelect.value) &&
                 (bathroomSelect.value === "" ||
                  String(house.bathrooms) === bathroomSelect.value);
    return test;
  });

  // Output the result count to the "result-count" paragraph
  resultCount.textContent = `Results returned: ${filteredHouses.length}`;

  // Empty the output element
  output.innerHTML = "";

  // Create renderHouse() function
  function renderHouse(house) {
    // Calculate total room size
    let totalArea = 0;
    const keys = Object.keys(house.room_sizes);
    for (let key of keys) {
      totalArea += house.room_sizes[key];
    }

    // Output house to UI
    const articleElem = document.createElement("article");
    articleElem.appendChild(document.createElement("h2")).textContent =
      `${house.house_number} ${house.street}`;
    const listElem = document.createElement("ul");
    listElem.appendChild(document.createElement("li")).textContent =
      `🛏️ Bedrooms: ${house.bedrooms}`;
    listElem.appendChild(document.createElement("li")).textContent =
      `🛀 Bathrooms: ${house.bathrooms}`;
    listElem.appendChild(document.createElement("li")).textContent =
      `Room area: ${totalArea}m²`;
    listElem.appendChild(document.createElement("li")).textContent =
      `Price: £${house.price}`;
    articleElem.appendChild(listElem);
    output.appendChild(articleElem);
  }

  // Pass each house in the filtered array into renderHouse()
  for (let house of filteredHouses) {
    renderHouse(house);
  }
}

// Add a submit listener to the <form> element
form.addEventListener("submit", renderHouses);

// Call fetchHouseData() to initialize the app
fetchHouseData();
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Test_your_skills/JSON", "Learn_web_development/Core/Scripting/Debugging_JavaScript", "Learn_web_development/Core/Scripting")}}
