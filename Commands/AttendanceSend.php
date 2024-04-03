<?php

namespace App\Console\Commands;

use App\Models\Attendance;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;

class AttendanceSend extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'attendance:send';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'This command will send the data to server';

    /**
     * Execute the console command.
     */
    public function handle(): void
    {
            $data_array = Attendance::where('status', 0)->get();


            // $data_array = [
            //     [
            //         "userId" => "1",
            //         "punchTime" => "2023-05-16 14:30:00",
            //         "punchType" => "Finger",
            //         "deviceId" => "123",
            //         "punchMode" => "IN"
            //     ]
            // ];

            $new_array = [];

            foreach ($data_array as $data)
            {
                $this_data = [
                    "userId" => $data->user_id,
                    "punchTime" => $data->punch_time,
                    "punchType" => "Finger",
                    "deviceId" => $data->device_id,
                    "punchMode" => $data->punch_mode
                ];

                array_push($new_array, $this_data);
            }

            $response = Http::acceptJson()->post(env('REMOTE_SERVER_URL').'/api/index.php',$new_array);

            if($response->ok()){

                foreach($data_array as $data){
                    Attendance::find($data->id)->update(['status' => 1]);
                }
                $this->info('Attendance Storred Successfully!');
            }
            else{
                $this->info('Something went wrong!');
            }
    }
}
