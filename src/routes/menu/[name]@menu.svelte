<script>
	import { page } from '$app/stores';
	import { fly, fade, slide } from 'svelte/transition';
	import { onMount } from 'svelte';
	import { flip } from 'svelte/animate';
	import { quintOut } from 'svelte/easing';
	let welcome = true;
	let ready = false;
	let order = false;
	let modal = false;
	let cart = [];
	let search = {
		visible: false,
		query: ''
	};
	$: cartSum = () => {
		let sum = 0;
		cart.forEach((item) => {
			sum += item.price * item.number;
		});

		return sum;
	};

	let menu = [
		{
			schedule: null,
			gallery: [],
			categories: [],
			dynamicId: 'popular',
			id: null,
			available: true,
			name: 'Популярные блюда',
			items: [
				{
					name: 'Гризли Биф Стейк салат',
					inStock: null,
					weight: '340 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '340.000',
						measure_unit: 'g'
					},
					id: 57931283,
					description:
						'Стейк из мраморной говядины, томаты, шампиньоны, картофель, цукини, перец болгарский, листья салата, травяной майонез, соус тысяча островов',
					available: true,
					promoTypes: [],
					price: 565,
					decimalPrice: '565',
					picture: {
						uri: '/images/3583740/3e55a183e7d9c702c37791db10d683a4-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Картофель фри',
					inStock: null,
					weight: '100 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '100.000',
						measure_unit: 'g'
					},
					id: 58393308,
					description: '',
					available: true,
					promoTypes: [],
					price: 210,
					decimalPrice: '210',
					picture: {
						uri: '/images/1370147/8cc806fe0160d24154b17f7e071b0824-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Ржаные гренки',
					inStock: null,
					weight: '100 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '100.000',
						measure_unit: 'g'
					},
					id: 58379443,
					description: 'С зеленью и чесноком',
					available: true,
					promoTypes: [],
					price: 195,
					decimalPrice: '195',
					picture: {
						uri: '/images/1380298/136e491a0ae6f9c1dba5a07628a9829a-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Огненные креветки Бабочки',
					inStock: null,
					weight: '150 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '150.000',
						measure_unit: 'g'
					},
					id: 58379448,
					description: 'С острым томатным соусом и сметаной',
					available: true,
					promoTypes: [],
					price: 690,
					decimalPrice: '690',
					picture: {
						uri: '/images/1380298/6a0ea0f2aeacd80d17c2f62e26718299-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Наваристый борщ',
					inStock: null,
					weight: '260 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '260.000',
						measure_unit: 'g'
					},
					id: 189559807,
					description: 'На свинине',
					available: true,
					promoTypes: [],
					price: 289,
					decimalPrice: '289',
					picture: null,
					optionsGroups: []
				}
			]
		},
		{
			schedule: null,
			gallery: [],
			categories: [],
			id: 13636807,
			available: true,
			name: 'Коптильня',
			items: [
				{
					name: 'Большое говяжье ребро',
					inStock: null,
					weight: '490 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '490.000',
						measure_unit: 'g'
					},
					id: 189557807,
					description: 'Копченное на ольхе методом low & slow, в фирменной глазури',
					available: true,
					promoTypes: [],
					price: 1290,
					decimalPrice: '1290',
					picture: {
						uri: '/images/3609085/b089cdd8edbf60f607b249c73d3fe3a8-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Брискет',
					inStock: null,
					weight: '380 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '380.000',
						measure_unit: 'g'
					},
					id: 189558697,
					description: 'Нежная мраморная говяжья грудинка, копчённая на ольхе',
					available: true,
					promoTypes: [],
					price: 980,
					decimalPrice: '980',
					picture: {
						uri: '/images/3521394/7dc70825b27978136d5056a7dde89992-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Фермерский куриный окорок',
					inStock: null,
					weight: '390 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '390.000',
						measure_unit: 'g'
					},
					id: 189558702,
					description: 'Подается с салатом, тортильей и соусом BBQ',
					available: true,
					promoTypes: [],
					price: 590,
					decimalPrice: '590',
					picture: {
						uri: '/images/1962206/eb000590690190ddad20dfee3db21e39-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				}
			]
		},
		{
			schedule: null,
			gallery: [],
			categories: [],
			id: 4645108,
			available: true,
			name: 'Салаты',
			items: [
				{
					name: 'Гризли Биф Стейк салат',
					inStock: null,
					weight: '340 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '340.000',
						measure_unit: 'g'
					},
					id: 57931283,
					description:
						'Стейк из мраморной говядины, томаты, шампиньоны, картофель, цукини, перец болгарский, листья салата, травяной майонез, соус тысяча островов',
					available: true,
					promoTypes: [],
					price: 565,
					decimalPrice: '565',
					picture: {
						uri: '/images/3583740/3e55a183e7d9c702c37791db10d683a4-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Салат Филадельфия',
					inStock: null,
					weight: '220 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '220.000',
						measure_unit: 'g'
					},
					id: 58051698,
					description: 'Сырные шарики, томаты, креветки, микс салата',
					available: true,
					promoTypes: [],
					price: 545,
					decimalPrice: '545',
					picture: {
						uri: '/images/1380298/e15d79afb5da30889819bc7dc56c1182-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Калифорнийский салат',
					inStock: null,
					weight: '230 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '230.000',
						measure_unit: 'g'
					},
					id: 58051703,
					description: 'Овощи, стручковая фасоль, микс салата, обжаренный лосось',
					available: true,
					promoTypes: [],
					price: 520,
					decimalPrice: '520',
					picture: {
						uri: '/images/1370147/5b708dc284a73717c5e34f79ca22a640-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Салат Цезарь с тигровыми креветками',
					inStock: null,
					weight: '200 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '200.000',
						measure_unit: 'g'
					},
					id: 58304598,
					description: 'Креветки гриль, листья салата с томатами, хрустящими гренками и пармезаном',
					available: true,
					promoTypes: [],
					price: 545,
					decimalPrice: '545',
					picture: {
						uri: '/images/1370147/321e6420737d03f3322bfffdac2288a1-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Греческий салат',
					inStock: null,
					weight: '280 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '280.000',
						measure_unit: 'g'
					},
					id: 58304603,
					description: 'Свежие овощи, сыр фета',
					available: true,
					promoTypes: [],
					price: 325,
					decimalPrice: '325',
					picture: {
						uri: '/images/1368744/d72d436ad3f7b2891d2dcf9f62dd4989-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Салат деревенский',
					inStock: null,
					weight: '200 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '200.000',
						measure_unit: 'g'
					},
					id: 556152318,
					description: 'С опятами, куриным филе, маринованными огурчиками и печеным перцем',
					available: true,
					promoTypes: [],
					price: 359,
					decimalPrice: '359',
					picture: {
						uri: '/images/3807631/ee3e15cf6996446af9c6551de98884c7-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Салат со страчателлой',
					inStock: null,
					weight: '165 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '165.000',
						measure_unit: 'g'
					},
					id: 556152323,
					description: 'Микс салата, помидоры черри, страчателла, клубника, бальзамик',
					available: true,
					promoTypes: [],
					price: 495,
					decimalPrice: '495',
					picture: {
						uri: '/images/3435765/bcfa7b0f1bd9306b9c63ace7e0e0f5ff-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Салат куриный с ореховой заправкой',
					inStock: null,
					weight: '200 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '200.000',
						measure_unit: 'g'
					},
					id: 556152508,
					description:
						'Листья салата, томаты черри, свежий огурчик, куриная грудка с ореховой заправкой, арахис',
					available: true,
					promoTypes: [],
					price: 369,
					decimalPrice: '369',
					picture: {
						uri: '/images/3798638/1b057884c59ca3991b8ddc63d75b6036-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Салат Цезарь с лососем',
					inStock: null,
					weight: '200 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '200.000',
						measure_unit: 'g'
					},
					id: 58051708,
					description: 'Лосось гриль, листья салата с томатами, хрустящими гренками и пармезаном',
					available: true,
					promoTypes: [],
					price: 595,
					decimalPrice: '595',
					picture: null,
					optionsGroups: []
				},
				{
					name: 'Салат Цезарь с куриным филе',
					inStock: null,
					weight: '200 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '200.000',
						measure_unit: 'g'
					},
					id: 58304593,
					description:
						'Куриное филе гриль, листья салата с томатами, хрустящими гренками и пармезаном',
					available: true,
					promoTypes: [],
					price: 395,
					decimalPrice: '395',
					picture: null,
					optionsGroups: []
				}
			]
		},
		{
			schedule: null,
			gallery: [],
			categories: [],
			id: 4661203,
			available: true,
			name: 'Закуски',
			items: [
				{
					name: 'Крылышки Баффало',
					inStock: null,
					weight: '300 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '300.000',
						measure_unit: 'g'
					},
					id: 58379433,
					description: 'Куриные крылышки острые или барбекю (на выбор)',
					available: true,
					promoTypes: [],
					price: 429,
					decimalPrice: '429',
					picture: {
						uri: '/images/1380298/215c53811e35efc1ad3b9a6c328a68d6-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: [
						{
							required: true,
							minSelected: 1,
							maxSelected: 1,
							id: 14081838,
							name: 'На выбор',
							options: [
								{
									multiplier: 1,
									id: 103958503,
									name: 'Острые',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 103958508,
									name: 'Барбекю',
									price: 0,
									decimalPrice: '0.00'
								}
							]
						}
					]
				},
				{
					name: 'Крылышки Баффало',
					inStock: null,
					weight: '600 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '600.000',
						measure_unit: 'g'
					},
					id: 58379438,
					description: 'Куриные крылышки',
					available: true,
					promoTypes: [],
					price: 750,
					decimalPrice: '750',
					picture: {
						uri: '/images/1380298/942d9145955927d25cfde03ad562bf5f-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: [
						{
							required: true,
							minSelected: 1,
							maxSelected: 2,
							id: 14081843,
							name: 'На выбор',
							options: [
								{
									multiplier: 1,
									id: 103958513,
									name: 'Острые',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 103958518,
									name: 'Барбекю',
									price: 0,
									decimalPrice: '0.00'
								}
							]
						}
					]
				},
				{
					name: 'Ржаные гренки',
					inStock: null,
					weight: '100 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '100.000',
						measure_unit: 'g'
					},
					id: 58379443,
					description: 'С зеленью и чесноком',
					available: true,
					promoTypes: [],
					price: 195,
					decimalPrice: '195',
					picture: {
						uri: '/images/1380298/136e491a0ae6f9c1dba5a07628a9829a-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Огненные креветки Бабочки',
					inStock: null,
					weight: '150 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '150.000',
						measure_unit: 'g'
					},
					id: 58379448,
					description: 'С острым томатным соусом и сметаной',
					available: true,
					promoTypes: [],
					price: 690,
					decimalPrice: '690',
					picture: {
						uri: '/images/1380298/6a0ea0f2aeacd80d17c2f62e26718299-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Золотистые луковые кольца',
					inStock: null,
					weight: '100 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '100.000',
						measure_unit: 'g'
					},
					id: 58379453,
					description: 'С соусом ранч',
					available: true,
					promoTypes: [],
					price: 325,
					decimalPrice: '325',
					picture: {
						uri: '/images/1368744/37f37ea9b623c4d64052a02b87b4fd9e-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Картофельные дольки Техас',
					inStock: null,
					weight: '350 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '350.000',
						measure_unit: 'g'
					},
					id: 58379458,
					description: 'С жареным беконом и сыром',
					available: true,
					promoTypes: [],
					price: 395,
					decimalPrice: '395',
					picture: {
						uri: '/images/1380298/ad205a736322525fbb24a2493b757dec-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Куриные пальчики',
					inStock: null,
					weight: '190 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '190.000',
						measure_unit: 'g'
					},
					id: 556216168,
					description: 'Подается со сметанным соусом',
					available: true,
					promoTypes: [],
					price: 349,
					decimalPrice: '349',
					picture: {
						uri: '/images/2783965/d92666033df3a22f330953849ff80ae9-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Пивной сет',
					inStock: null,
					weight: '580 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '580.000',
						measure_unit: 'g'
					},
					id: 556216173,
					description:
						'Ржаные гренки, крылья BBQ, сырные монетки с халапеньо, куриные пальчики (подаются с соусами Кетчуп и Сырный)',
					available: true,
					promoTypes: [],
					price: 680,
					decimalPrice: '680',
					picture: {
						uri: '/images/3507668/77e73dec200ea6c42b0f06542dd83e26-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Кесадилья с куриным филе',
					inStock: null,
					weight: '280 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '280.000',
						measure_unit: 'g'
					},
					id: 556299503,
					description: 'С сыром, томатами, гуакамоле и сметаной. Блюдо острое',
					available: true,
					promoTypes: [],
					price: 430,
					decimalPrice: '430',
					picture: {
						uri: '/images/3550919/110b382b978f6c30096da7183e90a779-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Кесадилья с креветками',
					inStock: null,
					weight: '280 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '280.000',
						measure_unit: 'g'
					},
					id: 556299508,
					description: 'С сыром, томатами, гуакамоле и сметаной. Блюдо острое',
					available: true,
					promoTypes: [],
					price: 570,
					decimalPrice: '570',
					picture: {
						uri: '/images/3806023/2b7055be5a36a7588c85e2c90130de01-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Хрустящие картофельные ломтики',
					inStock: null,
					weight: '240 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '240.000',
						measure_unit: 'g'
					},
					id: 104655040,
					description: 'С дипперами и тремя соусами',
					available: false,
					promoTypes: [],
					price: 395,
					decimalPrice: '395',
					picture: {
						uri: '/images/2370127/cb643be5c7c538c3ded06d3eee7cb6fd-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				}
			]
		},
		{
			schedule: null,
			gallery: [],
			categories: [],
			id: 13637057,
			available: true,
			name: 'Супы',
			items: [
				{
					name: 'Сливочный суп с морепродуктами',
					inStock: null,
					weight: '260 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '260.000',
						measure_unit: 'g'
					},
					id: 189559792,
					description: 'Креветки, лосось, шампиньоны',
					available: true,
					promoTypes: [],
					price: 465,
					decimalPrice: '465',
					picture: {
						uri: '/images/3506804/981ef287e459d3bfaca3af3af3d8ebe6-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Наваристый борщ',
					inStock: null,
					weight: '260 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '260.000',
						measure_unit: 'g'
					},
					id: 189559807,
					description: 'На свинине',
					available: true,
					promoTypes: [],
					price: 289,
					decimalPrice: '289',
					picture: null,
					optionsGroups: []
				}
			]
		},
		{
			schedule: null,
			gallery: [],
			categories: [],
			id: 4665268,
			available: true,
			name: 'Пицца',
			items: [
				{
					name: 'Пицца Пепперони',
					inStock: null,
					weight: '440 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '440.000',
						measure_unit: 'g'
					},
					id: 58389188,
					description: 'Сыр моцарелла, томатный соус, колбаски пепперони (30 см)',
					available: true,
					promoTypes: [],
					price: 485,
					decimalPrice: '485',
					picture: {
						uri: '/images/2370127/a8cb5c4d812fa7c5a5c1674265970a9f-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Пицца Маргарита',
					inStock: null,
					weight: '440 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '440.000',
						measure_unit: 'g'
					},
					id: 58389193,
					description: 'Сыр моцарелла, томатный соус (30 см)',
					available: true,
					promoTypes: [],
					price: 375,
					decimalPrice: '375',
					picture: {
						uri: '/images/3808326/9b657dc28d96f8b59764ef5a21862ea7-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Пицца Карбонара',
					inStock: null,
					weight: '490 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '490.000',
						measure_unit: 'g'
					},
					id: 58389198,
					description: 'Бекон, шампиньоны, сыр моцарелла, яйцо (30 см)',
					available: true,
					promoTypes: [],
					price: 525,
					decimalPrice: '525',
					picture: {
						uri: '/images/3483997/7fbf2e7989312401166004c5e391880c-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Пицца Морская',
					inStock: null,
					weight: '500 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '500.000',
						measure_unit: 'g'
					},
					id: 556279253,
					description:
						'С лососем, креветками, соусом ранч, красным и зеленым луком, сыром моцарелла (30 см)',
					available: true,
					promoTypes: [],
					price: 690,
					decimalPrice: '690',
					picture: {
						uri: '/images/1962206/eca6171caf2fdc3bf5a83fdd0bef6001-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Пицца Цыпленок BBQ',
					inStock: null,
					weight: '500 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '500.000',
						measure_unit: 'g'
					},
					id: 556279258,
					description: 'Филе цыпленка с соусом BBQ, беконом и моцареллой (30 см)',
					available: true,
					promoTypes: [],
					price: 545,
					decimalPrice: '545',
					picture: {
						uri: '/images/3534679/032f26458c422cdd37b5c43d4b4f55be-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Пицца Четыре сыра',
					inStock: null,
					weight: '450 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '450.000',
						measure_unit: 'g'
					},
					id: 556279263,
					description: 'С сырами Гауда, Моцарелла, Чедер, Дорблю и сырным соусом (30 см)',
					available: true,
					promoTypes: [],
					price: 530,
					decimalPrice: '530',
					picture: {
						uri: '/images/3513074/28817f686f508c553746028c740b5175-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Пицца 4 мяса',
					inStock: null,
					weight: '500 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '500.000',
						measure_unit: 'g'
					},
					id: 556279268,
					description:
						'С говядиной, беконом, куриной грудкой, ветчиной, моцареллой и томатным соусом (30 см)',
					available: true,
					promoTypes: [],
					price: 620,
					decimalPrice: '620',
					picture: {
						uri: '/images/3534679/49d984b65dd5fa2b8607d85411df2b47-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Пицца с каперсами',
					inStock: null,
					weight: '410 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '410.000',
						measure_unit: 'g'
					},
					id: 556279273,
					description: 'Куриная грудка, базилик, красный лук, моцарелла, соус ранч (30 см)',
					available: true,
					promoTypes: [],
					price: 489,
					decimalPrice: '489',
					picture: {
						uri: '/images/3595513/620a24dc890c3f97b89831effb1038d7-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				}
			]
		},
		{
			schedule: null,
			gallery: [],
			categories: [],
			id: 4665233,
			available: true,
			name: 'Паста',
			items: [
				{
					name: 'Паста Альфредо',
					inStock: null,
					weight: '340 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '340.000',
						measure_unit: 'g'
					},
					id: 58388563,
					description: 'Паста феттуччине, креветки, томаты, сливочно-томатный соус',
					available: true,
					promoTypes: [],
					price: 595,
					decimalPrice: '595',
					picture: {
						uri: '/images/1380298/e73592b5944ba8eb6465b4b9cab4c36b-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Паста Карбонара',
					inStock: null,
					weight: '300 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '300.000',
						measure_unit: 'g'
					},
					id: 58388568,
					description: 'Паста феттуччине, бекон, сливочный соус',
					available: true,
					promoTypes: [],
					price: 445,
					decimalPrice: '445',
					picture: {
						uri: '/images/1370147/9b75795430c0fd1f70e37739317320aa-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Паста Примавера',
					inStock: null,
					weight: '340 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '340.000',
						measure_unit: 'g'
					},
					id: 58388573,
					description: 'Феттуччине, куриное филе, белые грибы, овощи в базиликовом соусе',
					available: true,
					promoTypes: [],
					price: 480,
					decimalPrice: '480',
					picture: {
						uri: '/images/1370147/e768374c1aee260b95b7ce50bacd2620-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Паста с лососем',
					inStock: null,
					weight: '300 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '300.000',
						measure_unit: 'g'
					},
					id: 556293878,
					description: 'С красным луком и помидорами черри в сливочном соусе',
					available: true,
					promoTypes: [],
					price: 570,
					decimalPrice: '570',
					picture: {
						uri: '/images/3784951/0c666dcb246b6a08ade96f1036a1d0fa-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Паста Четыре сыра',
					inStock: null,
					weight: '300 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '300.000',
						measure_unit: 'g'
					},
					id: 556293883,
					description: 'Куриное филе, Моцарелла, Чеддер, Дорблю, Пармезан в сливочном соусе',
					available: true,
					promoTypes: [],
					price: 495,
					decimalPrice: '495',
					picture: {
						uri: '/images/3513074/5663d07bac2fcda2b37f12b66aa8a64b-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				}
			]
		},
		{
			schedule: null,
			gallery: [],
			categories: [],
			id: 4631078,
			available: true,
			name: 'Бургеры',
			items: [
				{
					name: 'Гризли Бургер',
					inStock: null,
					weight: '380 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '380.000',
						measure_unit: 'g'
					},
					id: 57598773,
					description:
						'С двумя котлетами из говядины, беконом, карамелизированным луком, маринованными огурчиками, сыром Чеддер, томатами, салатом и размариновым Айоли',
					available: true,
					promoTypes: [],
					price: 690,
					decimalPrice: '690',
					picture: {
						uri: '/images/3749380/7cd3185352fc559521243716002f6d70-{w}x{h}.jpg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Король дорог',
					inStock: null,
					weight: '370 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '370.000',
						measure_unit: 'g'
					},
					id: 57598783,
					description:
						'Говяжья котлета, печеный перец, маринованные огурчики, томаты, жареный бекон',
					available: true,
					promoTypes: [],
					price: 640,
					decimalPrice: '640',
					picture: {
						uri: '/images/3506707/9e0123478325ca7420c1c18bac497051-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Бад Бургер',
					inStock: null,
					weight: '280 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '280.000',
						measure_unit: 'g'
					},
					id: 57825193,
					description:
						'Большая котлета из говядины, салат, томаты, бекон, маринованные огурцы, сыр чеддер, соус на основе пива',
					available: true,
					promoTypes: [],
					price: 525,
					decimalPrice: '525',
					picture: {
						uri: '/images/1380298/ffbf43b6b28c1cf3d1d5125a27aa16e7-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Кантри бургер',
					inStock: null,
					weight: '290 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '290.000',
						measure_unit: 'g'
					},
					id: 57598793,
					description:
						'Говяжья котлета, маринованные огурчики, сыр Чеддер, салат, карамелизированный лук',
					available: false,
					promoTypes: [],
					price: 395,
					decimalPrice: '395',
					picture: {
						uri: '/images/2794391/608245945977f931ed7dff72dab3deb8-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Чизбургер',
					inStock: null,
					weight: '225 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '225.000',
						measure_unit: 'g'
					},
					id: 57598803,
					description: 'Говяжья котлета, сыр, томаты, красный лук',
					available: false,
					promoTypes: [],
					price: 389,
					decimalPrice: '389',
					picture: {
						uri: '/images/3378693/5b600d7bc3bb1b94a38261adbbd542d9-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Чикен бургер',
					inStock: null,
					weight: '215 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '215.000',
						measure_unit: 'g'
					},
					id: 556146508,
					description: 'С куриной котлетой, спелыми томатами, хрустящим салатом и соусом тартар',
					available: false,
					promoTypes: [],
					price: 295,
					decimalPrice: '295',
					picture: {
						uri: '/images/3490902/b542dd785353d1fdf5cdcd1e6f5170de-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Диабло бургер',
					inStock: null,
					weight: '250 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '250.000',
						measure_unit: 'g'
					},
					id: 556146513,
					description:
						'С сочной котлетой и острым соусом, зеленым майонезом, рагу из перцев и сыром моцарелла',
					available: false,
					promoTypes: [],
					price: 425,
					decimalPrice: '425',
					picture: {
						uri: '/images/3547279/696a9d35f534952a481cd477bbbd7c81-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				}
			]
		},
		{
			schedule: null,
			gallery: [],
			categories: [],
			id: 4643153,
			available: true,
			name: 'Сэндвичи',
			items: [
				{
					name: 'Биф Базука Сэндвич',
					inStock: null,
					weight: '280 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '280.000',
						measure_unit: 'g'
					},
					id: 66163502,
					description: 'Сочный говяжий ростбиф с карамелизированным луком и маринованными огурцами',
					available: true,
					promoTypes: [],
					price: 429,
					decimalPrice: '429',
					picture: {
						uri: '/images/3805363/14cadfe95372699aa8e95176c9629549-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Чикен Стейк сэндвич',
					inStock: null,
					weight: '240 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '240.000',
						measure_unit: 'g'
					},
					id: 556299498,
					description:
						'Сочный стейк из куриной грудки с томатами, красным луком, салатом и двумя соусами',
					available: true,
					promoTypes: [],
					price: 389,
					decimalPrice: '389',
					picture: {
						uri: '/images/3506707/20d2062eacc86b7369a3ccb0c3bcf52a-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				}
			]
		},
		{
			schedule: null,
			gallery: [],
			categories: [],
			id: 4665088,
			available: true,
			name: 'Стейки',
			items: [
				{
					name: 'Стейк Пеппер',
					inStock: null,
					weight: '250 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '250.000',
						measure_unit: 'g'
					},
					id: 58387343,
					description: 'Мраморное мясо тонкого края в панировке из смеси пяти перцев',
					available: true,
					promoTypes: [],
					price: 1290,
					decimalPrice: '1290',
					picture: {
						uri: '/images/1380298/7b391223f9e17a7733f731878c596b50-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: [
						{
							required: true,
							minSelected: 1,
							maxSelected: 1,
							id: 14082463,
							name: 'Прожарка',
							options: [
								{
									multiplier: 1,
									id: 103962338,
									name: 'Medium rare',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 103962343,
									name: 'Medium',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 103962348,
									name: 'Medium well',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 103962353,
									name: 'Well done',
									price: 0,
									decimalPrice: '0.00'
								}
							]
						},
						{
							required: true,
							minSelected: 1,
							maxSelected: 1,
							id: 14082468,
							name: 'Соус',
							options: [
								{
									multiplier: 1,
									id: 103962358,
									name: 'Медово-горчичный',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 103962363,
									name: 'Шеф-соус',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 103962368,
									name: 'Барбекю',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 103962373,
									name: 'Сырный',
									price: 0,
									decimalPrice: '0.00'
								}
							]
						}
					]
				},
				{
					name: 'Нью-Йорк стейк',
					inStock: null,
					weight: '250 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '250.000',
						measure_unit: 'g'
					},
					id: 58388463,
					description: 'Мраморное мясо тонкого края (прожарка и соус на выбор)',
					available: true,
					promoTypes: [],
					price: 1290,
					decimalPrice: '1290',
					picture: {
						uri: '/images/1370147/e3f641e7e5059b0244870aba7ac173f3-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: [
						{
							required: true,
							minSelected: 1,
							maxSelected: 1,
							id: 14082518,
							name: 'Прожарка',
							options: [
								{
									multiplier: 1,
									id: 103962578,
									name: 'Medium rare',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 103962583,
									name: 'Medium',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 103962588,
									name: 'Medium well',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 103962593,
									name: 'Well done',
									price: 0,
									decimalPrice: '0.00'
								}
							]
						},
						{
							required: true,
							minSelected: 1,
							maxSelected: 1,
							id: 14082523,
							name: 'Соус',
							options: [
								{
									multiplier: 1,
									id: 103962598,
									name: 'Медово-горчичный',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 103962603,
									name: 'Шеф-соус',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 103962608,
									name: 'Сырный',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 103962613,
									name: 'Барбекю',
									price: 0,
									decimalPrice: '0.00'
								}
							]
						}
					]
				},
				{
					name: 'Фленк стейк',
					inStock: null,
					weight: '300 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '300.000',
						measure_unit: 'g'
					},
					id: 104182535,
					description: 'Сочный стейк су-вид из покромки со стейковым картофелем',
					available: true,
					promoTypes: [],
					price: 840,
					decimalPrice: '840',
					picture: {
						uri: '/images/3816972/87efbbfe95700f604e680ff208592fef-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: [
						{
							required: true,
							minSelected: 1,
							maxSelected: 1,
							id: 157816878,
							name: 'Соус на выбор',
							options: [
								{
									multiplier: 1,
									id: 1936601468,
									name: 'Медово-горчичный',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 1936601473,
									name: 'Сырный',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 1936601478,
									name: 'BBQ',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 1936601483,
									name: 'Острый',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 1936601488,
									name: 'Шеф-соус',
									price: 0,
									decimalPrice: '0.00'
								}
							]
						}
					]
				},
				{
					name: 'Стейк Рибай',
					inStock: null,
					weight: '320 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '320.000',
						measure_unit: 'g'
					},
					id: 110036984,
					description: 'Легендарный сочный стейк из мраморной говядины',
					available: true,
					promoTypes: [],
					price: 2150,
					decimalPrice: '2150',
					picture: {
						uri: '/images/3454897/3cd341a8dea4014778c1c382359f9fb9-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: [
						{
							required: true,
							minSelected: 1,
							maxSelected: 1,
							id: 15081714,
							name: 'Прожарка',
							options: [
								{
									multiplier: 1,
									id: 110470859,
									name: 'Medium rare',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 110470864,
									name: 'Medium',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 110470869,
									name: 'Medium Well',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 110470874,
									name: 'Well Done',
									price: 0,
									decimalPrice: '0.00'
								}
							]
						},
						{
							required: true,
							minSelected: 1,
							maxSelected: 1,
							id: 15081719,
							name: 'Соус',
							options: [
								{
									multiplier: 1,
									id: 110470879,
									name: 'Барбекю',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 110470884,
									name: 'Сырный',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 110470889,
									name: 'Медово-горчичный',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 110470894,
									name: 'Соус от шефа',
									price: 0,
									decimalPrice: '0.00'
								}
							]
						}
					]
				},
				{
					name: 'Флэп стейк',
					inStock: null,
					weight: '400 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '400.000',
						measure_unit: 'g'
					},
					id: 556146623,
					description: 'Стейк из поясничной части (кострец) с овощами гриль',
					available: true,
					promoTypes: [],
					price: 890,
					decimalPrice: '890',
					picture: {
						uri: '/images/3805363/f628ee58987dac88b5150628678d6926-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: [
						{
							required: true,
							minSelected: 1,
							maxSelected: 1,
							id: 157816883,
							name: 'Соус на выбор',
							options: [
								{
									multiplier: 1,
									id: 1936601493,
									name: 'Медово-горчичный',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 1936601498,
									name: 'Сырный',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 1936601503,
									name: 'BBQ',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 1936601508,
									name: 'Острый',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 1936601513,
									name: 'Шеф-соус',
									price: 0,
									decimalPrice: '0.00'
								}
							]
						}
					]
				},
				{
					name: 'Большая тарелка стейков',
					inStock: null,
					weight: '800 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '800.000',
						measure_unit: 'g'
					},
					id: 556146838,
					description:
						'Фланк-стейк, стейк из куриной грудки и cвинoй вырезки. Подается с овощами гриль, стейковым картофелем и двумя соусами',
					available: true,
					promoTypes: [],
					price: 2200,
					decimalPrice: '2200',
					picture: {
						uri: '/images/3106738/51edff0e4ca58f1af2d5ebb6a10e572e-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				}
			]
		},
		{
			schedule: null,
			gallery: [],
			categories: [],
			id: 4664483,
			available: true,
			name: 'Горячие блюда',
			items: [
				{
					name: 'Ребрышки в мясной глазури',
					inStock: null,
					weight: '540 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '540.000',
						measure_unit: 'g'
					},
					id: 58381143,
					description: 'Ребрышки свиные, картофельные дольки, соус барбекю',
					available: true,
					promoTypes: [],
					price: 890,
					decimalPrice: '890',
					picture: {
						uri: '/images/1380298/33ddfc49cd3af6b2974eb4260608bbc3-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: [
						{
							required: true,
							minSelected: 1,
							maxSelected: 1,
							id: 157816958,
							name: 'На выбор',
							options: [
								{
									multiplier: 1,
									id: 1936601648,
									name: 'Острые',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 1936601653,
									name: 'Не острые',
									price: 0,
									decimalPrice: '0.00'
								}
							]
						}
					]
				},
				{
					name: 'Томленые говяжьи щечки',
					inStock: null,
					weight: '420 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '420.000',
						measure_unit: 'g'
					},
					id: 58383453,
					description: 'Говяжьи щечки, мясной соус, картофельное пюре',
					available: true,
					promoTypes: [],
					price: 590,
					decimalPrice: '590',
					picture: {
						uri: '/images/1368744/0571135bc84e5a04ee13834972b5b956-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Бифштекс с яйцом',
					inStock: null,
					weight: '310 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '310.000',
						measure_unit: 'g'
					},
					id: 58383458,
					description: 'Бифштекс из говядины, яйцо, картофель хашбраун, аджика',
					available: true,
					promoTypes: [],
					price: 640,
					decimalPrice: '640',
					picture: {
						uri: '/images/1380298/79d3efaa4f33a115d42d0d0bbd1806cb-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Лосось по-гавайски',
					inStock: null,
					weight: '190 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '190.000',
						measure_unit: 'g'
					},
					id: 58388983,
					description: 'Приготовлено в вакууме методом су-вид. Подается с салатом из свежих овощей',
					available: true,
					promoTypes: [],
					price: 795,
					decimalPrice: '795',
					picture: {
						uri: '/images/3813301/976188b93b0f4f3d1a9bdcc2a70f6e51-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Медальоны из свинины',
					inStock: null,
					weight: '270 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '270.000',
						measure_unit: 'g'
					},
					id: 556150368,
					description: 'С соусом блю чиз. Подается на печеном картофеле',
					available: true,
					promoTypes: [],
					price: 585,
					decimalPrice: '585',
					picture: {
						uri: '/images/3593277/a4d9e79e40bfe689a33c617c89e0a570-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Бефстроганов с пюре',
					inStock: null,
					weight: '380 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '380.000',
						measure_unit: 'g'
					},
					id: 556150373,
					description:
						'Мраморная говядина, лук, шампиньоны, сливки. Подается на подушке из картофельного пюре с маринованными огурчиками',
					available: true,
					promoTypes: [],
					price: 535,
					decimalPrice: '535',
					picture: {
						uri: '/images/3809330/fd28d8d565960bfca70664536ff28caa-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Креветки в винном соусе',
					inStock: null,
					weight: '180 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '180.000',
						measure_unit: 'g'
					},
					id: 559460788,
					description: 'Подается с лимоном и гренками',
					available: true,
					promoTypes: [],
					price: 730,
					decimalPrice: '730',
					picture: {
						uri: '/images/3454897/9f82c4d61eb7dbdd3c233b7720f946df-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Свиная корейка',
					inStock: null,
					weight: '340 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '340.000',
						measure_unit: 'g'
					},
					id: 58381153,
					description: 'Корейка свиная, молодой картофель, соус барбекю',
					available: false,
					promoTypes: [],
					price: 590,
					decimalPrice: '590',
					picture: {
						uri: '/images/1380298/913520704880ba52b2444cf0d65a870d-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				}
			]
		},
		{
			schedule: null,
			gallery: [],
			categories: [],
			id: 4665643,
			available: true,
			name: 'Гарниры',
			items: [
				{
					name: 'Картофель фри',
					inStock: null,
					weight: '100 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '100.000',
						measure_unit: 'g'
					},
					id: 58393308,
					description: '',
					available: true,
					promoTypes: [],
					price: 210,
					decimalPrice: '210',
					picture: {
						uri: '/images/1370147/8cc806fe0160d24154b17f7e071b0824-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Картофельные дольки',
					inStock: null,
					weight: '100 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '100.000',
						measure_unit: 'g'
					},
					id: 58393313,
					description: '',
					available: true,
					promoTypes: [],
					price: 210,
					decimalPrice: '210',
					picture: {
						uri: '/images/3583740/01a1ac58e110c78f7c96d8ef734ced87-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Овощи гриль',
					inStock: null,
					weight: '200 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '200.000',
						measure_unit: 'g'
					},
					id: 58393323,
					description: '',
					available: true,
					promoTypes: [],
					price: 295,
					decimalPrice: '295',
					picture: {
						uri: '/images/3583862/829772f8b0d075f20ca8b068554637f5-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Молодой картофель',
					inStock: null,
					weight: '140 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '140.000',
						measure_unit: 'g'
					},
					id: 58393318,
					description: '',
					available: false,
					promoTypes: [],
					price: 285,
					decimalPrice: '285',
					picture: {
						uri: '/images/3583740/4667488b17f4ff8b13226d72d7836870-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				}
			]
		},
		{
			schedule: null,
			gallery: [],
			categories: [],
			id: 4665808,
			available: true,
			name: 'Десерты',
			items: [
				{
					name: 'Чизкейк Нью-Йорк',
					inStock: null,
					weight: '120 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '120.000',
						measure_unit: 'g'
					},
					id: 110037059,
					description: 'С ягодным соусом',
					available: true,
					promoTypes: [],
					price: 310,
					decimalPrice: '310',
					picture: {
						uri: '/images/3528150/a302b7f8c64884fb512893f302035e5f-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Морковный торт',
					inStock: null,
					weight: '225 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '225.000',
						measure_unit: 'g'
					},
					id: 189558757,
					description: 'С нежным кремом, орехами и апельсиновой цедрой',
					available: true,
					promoTypes: [],
					price: 295,
					decimalPrice: '295',
					picture: {
						uri: '/images/2353725/abddfa676702550d4d4c285bb00bcead-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				},
				{
					name: 'Черничный тарт',
					inStock: null,
					weight: '180 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '180.000',
						measure_unit: 'g'
					},
					id: 559460953,
					description: 'Со взбитыми сливками',
					available: true,
					promoTypes: [],
					price: 320,
					decimalPrice: '320',
					picture: {
						uri: '/images/3472725/1aac562e8c482e77e07dcc91568524b8-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: []
				}
			]
		},
		{
			schedule: null,
			gallery: [],
			categories: [],
			id: 4665828,
			available: true,
			name: 'Напитки',
			items: [
				{
					name: 'Сок Rich',
					inStock: null,
					weight: '200 мл',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '200.000',
						measure_unit: 'ml'
					},
					id: 66160717,
					description: 'В ассортименте',
					available: true,
					promoTypes: [],
					price: 149,
					decimalPrice: '149',
					picture: {
						uri: '/images/3514991/b4ea5df4bcc28ea48ec0b1e633691b3d-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: [
						{
							required: true,
							minSelected: 1,
							maxSelected: 1,
							id: 14258407,
							name: 'На выбор',
							options: [
								{
									multiplier: 1,
									id: 105095287,
									name: 'Яблоко',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 105095292,
									name: 'Апельсин',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 105095297,
									name: 'Томат',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 105095302,
									name: 'Персик',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 105095307,
									name: 'Вишня',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 105095312,
									name: 'Ананас',
									price: 0,
									decimalPrice: '0.00'
								}
							]
						}
					]
				},
				{
					name: 'Кока-кола',
					inStock: null,
					weight: '200 мл',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '200.000',
						measure_unit: 'ml'
					},
					id: 66160722,
					description: 'В ассортименте',
					available: true,
					promoTypes: [],
					price: 185,
					decimalPrice: '185',
					picture: {
						uri: '/images/1380157/b2ff58fe3199d836276cc5cb844e3f44-{w}x{h}.jpg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: [
						{
							required: true,
							minSelected: 1,
							maxSelected: 1,
							id: 14258412,
							name: 'На выбор',
							options: [
								{
									multiplier: 1,
									id: 105095317,
									name: 'Классическая',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 105095327,
									name: 'Без сахара',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 1933934323,
									name: 'Фанта',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 1933934328,
									name: 'Спрайт',
									price: 0,
									decimalPrice: '0.00'
								}
							]
						}
					]
				},
				{
					name: 'Becks',
					inStock: null,
					weight: '330 мл',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '330.000',
						measure_unit: 'ml'
					},
					id: 104546595,
					description: 'Пиво безалкогольное, светлое',
					available: true,
					promoTypes: [],
					price: 260,
					decimalPrice: '260',
					picture: null,
					optionsGroups: []
				}
			]
		},
		{
			schedule: null,
			gallery: [],
			categories: [],
			id: 26967283,
			available: true,
			name: 'Соусы',
			items: [
				{
					name: 'Соус',
					inStock: null,
					weight: '40 г',
					adult: false,
					shippingType: 'all',
					measure: {
						value: '40.000',
						measure_unit: 'g'
					},
					id: 511721093,
					description: 'В ассортименте',
					available: true,
					promoTypes: [],
					price: 59,
					decimalPrice: '59',
					picture: {
						uri: '/images/3518584/0e675c0796c92a1d642b80d81947dbb7-{w}x{h}.jpeg',
						ratio: 1,
						scale: 'aspect_fill'
					},
					optionsGroups: [
						{
							required: true,
							minSelected: 1,
							maxSelected: 1,
							id: 154190523,
							name: 'На выбор',
							options: [
								{
									multiplier: 1,
									id: 1918159353,
									name: 'Сырный',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 1918159358,
									name: 'BBQ',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 1918159368,
									name: 'Сметанный',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 1918159373,
									name: 'Айоли',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 1918159378,
									name: 'Шеф-соус',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 1918159383,
									name: 'Цезарь',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 1918159388,
									name: 'Аджика',
									price: 0,
									decimalPrice: '0.00'
								},
								{
									multiplier: 1,
									id: 1918159393,
									name: 'Острый',
									price: 0,
									decimalPrice: '0.00'
								}
							]
						}
					]
				}
			]
		}
	];
	let tabs = {
		tabsBox: '',
		tabsElements: {},
		listBox: '',
		listElements: {}
	};

	let currentTab = menu[0].name;
	$: filteredMenu = () => {
		let newMenu = menu.filter((category) => {
			let t = category.items.filter((item) => {
				return item.name.toLowerCase().includes(search.query.toLowerCase());
			});
			// console.log(t);
			return t.length > 0;
		});

		newMenu.forEach((category) => {
			category.items = category.items.filter((item) => {
				return item.name.toLowerCase().includes(search.query.toLowerCase());
			});
		});
		return newMenu;
	};

	const setActiveTab = (name) => {
		currentTab = name;
		tabs.tabsBox.scrollLeft =
			tabs.tabsElements[name].offsetLeft -
			tabs.tabsBox.offsetWidth / 2 +
			tabs.tabsElements[name].offsetWidth / 2 -
			10;
	};

	const scrollToActive = (name) => {
		console.log(tabs.listBox);
		tabs.listBox.scrollTop = tabs.listElements[name].offsetTop;
	};

	onMount(() => {
		ready = true;
	});
</script>

<div class="content">
	{#if ready}
		{#if welcome}
			<!-- welcome screen  -->
			<div class="welcome screen" transition:fly={{ x: -400, duration: 600 }}>
				<div class="welcome-wrapper">
					<div class="welcome-img">
						<picture>
							<img src="/welcome.svg" alt="Welcome" />
						</picture>
					</div>
					<div class="welcome-text">
						<div class="welcome-title">Приветствуем вас</div>
						<div class="welcome-subtitle">Заказывайте все, что хотите, в любимом ресторане.</div>
					</div>
				</div>
				<button
					on:click={() => {
						welcome = !welcome;
					}}
					class="welcome-btn btn">Меню ➡</button
				>
			</div>
		{:else}
			<!-- menu screen  -->
			<div class="menu screen" transition:fly={{ x: 400, duration: 600 }}>
				<div class="shadow" />
				<div class="menu-nav">
					<button
						class="btn menu-search show"
						on:click={() => {
							search.visible = !search.visible;
						}}
						><img class="icon" src="/search-icon.png" alt="Search" />
					</button>
					<div class="menu-title">
						{#if !search.visible}
							<h2 transition:fly={{ y: -100, duration: 300 }}>Меню</h2>
						{/if}
						{#if search.visible}
							<input
								transition:fly={{ y: -100, duration: 300 }}
								bind:value={search.query}
								type="text"
								placeholder="Поиск"
							/>
						{/if}
					</div>
					<button
							on:click={() => {
								welcome = !welcome;
							}}
							class="btn menu-search"><img class="icon" src="/home-icon.png" alt="Назад" /></button
						>
				</div>
				<div class="menu-wrapper" bind:this={tabs.listBox}>
					<div bind:this={tabs.tabsBox} id="tabs" class="menu-tabs">
						{#each filteredMenu() as category}
							<button
								class="btn menu-tab"
								bind:this={tabs.tabsElements[category.name]}
								class:active={currentTab === category.name}
								on:click={() => {
									setActiveTab(category.name);
									scrollToActive(category.name);
								}}>{category.name}</button
							>
						{/each}
					</div>

					<div class="menu-list">
						{#each filteredMenu() as category}
							<div class="menu-category">
								<div class="menu-category-title" bind:this={tabs.listElements[category.name]}>
									{category.name}
								</div>
								{#each category.items as item}
									{#if item.picture !== null}
										<div class="menu-item">
											<div class="menu-image">
												<img src="https://eda.yandex.ru/{item.picture?.uri}" alt={item.id} />
											</div>
											<div class="menu-text">
												<h3 class="menu-name">{item.name}</h3>
												<h4 class="menu-weight">{item.weight}</h4>
												<h3 class="menu-price">{item.price} ₽</h3>
											</div>
											<div class="menu-actions">
												{#if cart.findIndex((el) => {
													return el.name === item.name && el.id === item.id;
												}) !== -1}
													<button
														transition:fly={{ x: 100, duration: 600 }}
														on:click={() => {
															cart = cart.filter((el) => {
																return !(el.name === item.name && el.id === item.id);
															});
														}}
														class="btn menu-add primary"
													>
														<img src="/tick.svg" alt="+" /></button
													>
												{:else}
													<button
														transition:fly={{ x: 100, duration: 600 }}
														on:click={() => {
															cart = [{ ...item, number: 1 }, ...cart];
														}}
														class="btn menu-add"
													>
														<img src="/plus.svg" alt="+" /></button
													>
												{/if}
											</div>
										</div>
									{/if}
								{/each}
							</div>
						{/each}
					</div>
				</div>

				{#if cart.length > 0 && !order}
					<div class="menu-cart" transition:fly={{ y: 200, duration: 600 }}>
						<button
							on:click={() => {
								order = !order;
							}}
							class="btn welcome-btn menu-cart-btn"
						>
							<div class="menu-cart-count">
								{cart.length} <span>эл.</span>
							</div>
							<div class="menu-cart-title">Посмотреть заказ</div>
							<div class="menu-cart-price">
								{cartSum()} <span>₽</span>
							</div>
						</button>
					</div>
				{/if}
			</div>

			{#if order}
				<div class="screen order" transition:fly={{ y: -400, duration: 600 }}>
					<div class="menu-nav">
						<button
							on:click={() => {
								order = !order;
							}}
							class="btn menu-search"><img class="icon" src="/back.svg" alt="Назад" /></button
						>
						<h2 class="menu-title">Заказ</h2>
						<button
							class="btn menu-search"
							on:click={() => {
								modal = !modal;
							}}><img class="icon" src="/trash-icon.png" alt="Очистить" /></button
						>
					</div>
					<div class="menu-wrapper">
						<div class="menu-list">
							{#each cart as item (item.id)}
								<div
									class="menu-item"
									transition:fade={{ duration: 222 }}
									animate:flip={{ duration: 1000, easing: quintOut }}
								>
									<div class="menu-image">
										<img src="https://eda.yandex.ru/{item.picture?.uri}" alt={item.id} />
									</div>
									<div class="menu-text">
										<h3 class="menu-name">{item.name}</h3>
										<div class="order-number ">
											<button
												on:click={() => {
													item.number -= 1;
													item.number < 1 ? (cart = cart.filter((el) => el !== item)) : '';
												}}><img src="/minus.svg" alt="+" /></button
											>
											<div class="order-count">{item.number}</div>
											<button
												on:click={() => {
													item.number += 1;
												}}><img src="/plus.svg" alt="+" /></button
											>
										</div>
									</div>
									<div class="menu-actions order-actions">
										<div class="item-price">
											{item.price * item.number} <span>₽</span>
										</div>
									</div>
								</div>
							{/each}
						</div>
					</div>

					{#if cart.length > 0}
						<div class="menu-cart" transition:fly={{ y: 200, duration: 600 }}>
							<button
								on:click={() => {
									order = !order;
								}}
								class="btn welcome-btn menu-cart-btn"
							>
								<div class="menu-cart-title">Заказать</div>
							</button>
						</div>
					{/if}
				</div>
			{/if}
		{/if}

		{#if modal}
			<div class="modal" transition:fade={{ duration: 200 }}>
				<div class="overlay" />
				<div class="modal-wrapper" transition:fly={{ y: -200, duration: 300 }}>
					<div class="modal-title" />
					<div class="modal-buttons">
						<button
							on:click={() => {
								modal = !modal;
							}}
							class="btn modal-btn">Отмена</button
						>
						<button
							on:click={() => {
								modal = !modal;
								cart = [];
							}}
							class="btn modal-btn primary">Ок</button
						>
					</div>
				</div>
			</div>
		{/if}
	{/if}
</div>

<style lang="scss">
	.screen {
		position: absolute;
		height: 100%;
		width: 100%;
		top: 0;
		left: 0;
		padding: 0.5rem;
		text-align: center;
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
	}
	.content {
		width: 100vw;
		height: 100%;
		max-width: 400px;
		max-height: 800px;
		margin: 0 auto;
		overflow: visible;
		position: relative;
		// border: 1px solid rgba(255, 255, 255, 0.212);
		border-radius: 1rem;
	}
	.btn {
		color: var(--primary-color);
		border: none;
		outline: none;
		border-radius: 1rem;
		color: white;
		font-size: 1rem;
		cursor: pointer;
		background: var(--second-color);
		padding: 0.9rem;
		display: flex;
		justify-content: center;
		align-items: center;
		z-index: 2;
		img {
			max-width: 30px;
		}
		&.primary {
			background: var(--primary-color);
		}
	}
	.welcome {
		position: relative;

		width: 100%;
		height: 100%;
		// padding-bottom: 30%;
		// padding-top: 0;
		text-align: center;
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
		&-wrapper {
			margin-top: auto;
			text-align: center;
			display: flex;
			justify-content: center;
			align-items: center;
			flex-direction: column;
		}
		img {
			width: 100%;
		}
		&-text {
			max-width: 75%;
		}
		&-title {
			font-weight: 600;
			font-size: 1.7rem;
			margin-top: 40px;
			margin-bottom: 10px;
		}
		&-subtitle {
			color: var(--second-text);
			font-weight: 400;
			font-size: 1rem;
			line-height: 1.6rem;
			margin-bottom: 10px;
		}
		&-btn {
			background: var(--primary-color);
			padding: 1rem;
			width: 100%;
			font-weight: 600;
			font-size: 1.2rem;
			margin-top: auto;
		}
	}
	.menu {
		&-title {
			position: relative;
			width: 100%;
			margin: 1rem;
			h2 {
				position: absolute;
				top: 0;
				left: 50%;
				transform: translate(-50%, -50%);
			}
			input {
				position: absolute;
				width: 100%;
				top: 0;
				left: 0;
				transform: translate(0px, -50%);
				color: var(--primary-color);
				border: none;
				outline: none;
				border-radius: 1rem;
				color: white;
				font-size: 1rem;
				cursor: pointer;
				background: var(--second-color);
				padding: 0.9rem;
				display: flex;
				justify-content: center;
				align-items: center;
				z-index: 2;
			}
		}
		.shadow {
			position: absolute;
			height: 50px;
			width: 100%;
			bottom: 0;
			left: 0;
			background: var(--bg-color);
			z-index: 1;
			transform: rotate(180deg);
			background: linear-gradient(180deg, var(--bg-color) 0%, rgba(255, 255, 255, 0) 100%);
		}
		&-nav {
			display: flex;
			justify-content: space-between;
			align-items: center;
			width: 100%;
		}
		&-wrapper {
			width: 100%;
			overflow-y: scroll;
			margin-top: 1rem;
			position: relative;
			height: 100%;
			-ms-overflow-style: none;
			scrollbar-width: none;
			overflow-x: hidden;
			overflow-y: scroll;
			-webkit-overflow-scrolling: touch;
			scroll-behavior: smooth;
			&::-webkit-scrollbar {
				display: none;
			}
			padding-bottom: 70px;
		}
		&-tabs {
			display: flex;
			justify-content: start;
			align-items: center;
			-ms-overflow-style: none;
			scrollbar-width: none;
			overflow-x: scroll;
			overflow-y: hidden;
			-webkit-overflow-scrolling: touch;
			scroll-behavior: smooth;
			&::-webkit-scrollbar {
				display: none;
			}
			margin-bottom: 1rem;
		}
		&-tab {
			background: none;
			color: var(--text-color);
			white-space: nowrap;
			margin: 0 0.5rem;
			transition: 0.3s all;
			&.active {
				background: var(--primary-color) !important;
				color: white;
			}
		}
		&-cart {
			margin-top: auto;
			width: 100%;
			position: absolute;
			bottom: 0;
			z-index: 3;
			&-price {
				background: rgba(255, 255, 255, 0.1);
				padding: 0.4em;
				border-radius: 0.5rem;
			}
			&-btn {
				font-weight: normal;
				display: flex;
				justify-content: center;
				align-items: center;
				width: 100%;
				div {
					display: flex;
					justify-content: center;
					align-items: center;
					margin: 0 auto;
					&:first-child {
						margin-left: 0;
					}
					&:last-child {
						margin-right: 0;
					}
				}
				span {
					font-size: 0.9rem;
					font-weight: 200;
					margin-left: 5px;
				}
			}
		}
		&-list {
			width: 100%;
			// overflow-y: scroll;
			// height: 100%;
		}
		&-category {
			&-title {
				text-align: left;
				font-size: 1.1rem;
				font-weight: bold;
				margin-top: 1.5rem;
			}
		}
		&-item {
			width: 100%;
			display: flex;
			justify-content: start;
			align-items: center;
			margin: 1rem 0;
			overflow: hidden;
		}
		&-actions {
			margin-left: auto;
			position: relative;
			min-width: 40px;
			height: 40px;
			span {
				margin-left: 5px;
			}
			button {
				position: absolute;
				right: 0;
				top: 50%;
				transform: translateY(-50%);
				img {
					width: 12px;
					height: 12px;
				}
			}
		}
		&-text {
			text-align: left;
			font-weight: normal;
			margin-left: 16px;
			// width: 100%;
			h3 {
				font-weight: normal;
				font-size: 1rem;
			}
			h4 {
				font-weight: 100;
				font-size: 0.9rem;
				color: var(--second-text);
			}
		}
		&-image {
			height: 80px;
			width: 80px;
			min-width: 80px;
			overflow: hidden;
			border-radius: 1rem;
			img {
				width: 100%;
				height: 100%;
				object-fit: cover;
			}
		}
	}
	.order {
		background: var(--bg-color);
		z-index: 5;
		.item-price {
			white-space: nowrap;
		}
		&-actions {
			display: flex;
			justify-content: center;
			align-items: center;
			font-weight: bold;
		}
		&-number {
			background: var(--second-color);
			padding: 0.4em 0.6rem;
			border-radius: 0.5rem;
			margin-top: 0.5rem;
			display: flex;
			justify-content: center;
			align-items: center;
			width: auto;
			display: inline-flex;
			button {
				border: none;
				background: none;
				height: 20px;
				width: 20px;
				margin: 0 0.5rem;
				display: flex;
				justify-content: center;
				align-items: center;
				cursor: pointer;
				&:first-child {
					margin-left: 0;
				}
				&:last-child {
					margin-right: 0;
				}
			}
		}
		.menu {
			&-search {
				// margin-right: auto;
				width: 58px;
				height: 58px;
				&:first-child {
					img {
						transform: scale(1.4);
					}
				}
			}
			&-title {
				margin-right: auto;
				margin-left: auto;
			}
			&-nav {
				justify-content: center;
			}
		}
	}
	.modal {
		position: absolute;
		width: 100%;
		height: 100%;
		z-index: 99;
		display: flex;
		justify-content: center;
		align-items: center;
		&-wrapper {
			width: 100%;
			margin: 2.5rem;
			background: #000;
			overflow: hidden;
			border-radius: 1rem;
			color: var(--text-color);
		}
		&-buttons {
			display: flex;
			justify-content: start;
			align-items: center;
		}
		&-btn {
			width: 50%;
			border-radius: 0px;

			&:first-child {
				color: var(--text-color);
			}
		}
		.overlay {
			position: absolute;
			width: 100%;
			height: 100%;
			background: var(--bg-color);
			opacity: 0.8;
			backdrop-filter: blur(50px);
		}
	}
</style>
