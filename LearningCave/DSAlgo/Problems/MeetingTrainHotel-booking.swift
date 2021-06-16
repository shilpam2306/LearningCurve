//
//  Meeting:Hotel-booking.swift
//  DSAlgo
//
//  Created by Shilpa M on 16/06/21.
//


//Find if k bookings possible with given arrival and departure times

//Solution: Idea is sorting both array and finding
//The idea is to simply sort the 2 arrays (Array for arrival dates and Array for departure dates) first.
//Now, the next step would be to check how many overlaps are present in one particular range. If the number of overlaps are greater than the number of rooms, we can say that we have less rooms to accommodate guests.
//
//So, for a particular range where arrival date(ith of Arrival array) being the start date and departure date(ith of departure array) being the end date, overlap can be only possible if the next arrival dates(from i+1th) are less than end date of the range and greater than or equal to start date of the range (Since this is a sorted array, we don’t need to take care about the latter condition).
//
//Considering the fact, that we have sorted array, we directly need to check if the next Kth (i+Kth) arrival date falls in the range, if it does, all the dates before that arrival date will also fall in the taken range, resulting in K+1 overlaps with the range in question, hence exceeding the number of rooms.

//k - rooms
//n - advanced booking
func areBookingsPossible( A : [Int], B : [Int],
                          K : Int,  N : Int) -> String
{
    let A = A.sorted()
    let B = A.sorted()
     
    for i in 0..<N {
        if (i + K < N && A[i + K] < B[i])
        {
            return "No"
        }
    }
    return "Yes"
}
 

var arrival = [ 1, 2, 3 ]
var departure = [ 2, 3, 4 ]
var N = arrival.count / arrival[0]
var K = 1
