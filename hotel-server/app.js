const express = require('express')
const app = express() 

const hotels = [
    {
        id: 1,
        title: 'The Historic Crags Lodge By Diamond Resorts', 
        amenities: ['Breakfast', 'Wifi'],
        rating: 4.5, 
        price: 119, 
        photoUrl: 'https://images.trvl-media.com/hotels/1000000/300000/297000/296989/a280fb04.jpg?impolicy=resizecrop&rw=455&ra=fit'
    },
    {
        id: 2, 
        amenities: ['Breakfast'],
        title: 'Discovery Lodge', 
        rating: 4.2, 
        price: 114, 
        photoUrl: 'https://images.trvl-media.com/hotels/9000000/8410000/8410000/8409911/581a590f.jpg?impolicy=resizecrop&rw=455&ra=fit'
    }, 
    {
        id: 3, 
        amenities: ['Wifi'],
        title: 'Murphy\'s River Lodge', 
        rating: 4.5, 
        price: 134, 
        photoUrl: 'https://images.trvl-media.com/hotels/5000000/4160000/4154300/4154290/77d65ed1.jpg?impolicy=resizecrop&rw=455&ra=fit'
    },
    {
        id: 4, 
        amenities: ['Wifi', 'Breakfast', 'Parking'], 
        title: 'Nicky\'s Resort', 
        rating: 4.3, 
        price: 89, 
        photoUrl: 'https://images.trvl-media.com/hotels/8000000/7450000/7440600/7440513/d6c4bfae.jpg?impolicy=resizecrop&rw=455&ra=fit'
    }
]

app.get('/hotels', (req, res) => {

    let filteredResults = hotels 

    // extract query string 
    const price = req.query.price
    const rating = req.query.rating 
    const popularFilters = req.query.popularFilters
 
    // apply price filter 
    if(price) {      
        filteredResults = hotels.filter((hotel) => {
            return hotel.price <= price  
        })
    } 

    // apply the rating filter 
    if(rating) {
        filteredResults = filteredResults.filter((hotel) => {
            return hotel.rating >= rating 
        })
    }

    // apply popular filters 
    if(popularFilters) {
        filteredResults = filteredResults.filter((hotel) => {
            if(!Array.isArray(popularFilters)) {
                return hotel.amenities.some(am => popularFilters.includes(am))
            } else {
                console.log(popularFilters)
                return popularFilters.every(amenity => hotel.amenities.includes(amenity))
            }
           
        })
    }

    res.json(filteredResults)
})

app.listen(8080, () => {
    console.log('Server is running...')
})