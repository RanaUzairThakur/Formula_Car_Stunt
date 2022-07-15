using UnityEngine;

public class Speedbar : MonoBehaviour
{
    public GameObject player;
    //public Transform FollowThis;
    public float OffsetYScreenFraction;
    private Vector3 pos;
    public Vector3 Offset;
    public float speedMultiplayer;
    void Start()
    {
        if (!player)
            player = Toolbox.GameplayController.SelectedVehiclePrefab;
    }

    // Update is called once per frame
    void Update()
    {
        if (!player)
            player = Toolbox.GameplayController.SelectedVehiclePrefab;

        if (!player)
            return;
        
        pos = Camera.main.WorldToScreenPoint(player.transform.position +Offset );
        pos.y -= Screen.height * OffsetYScreenFraction;
        //this.transform.position = pos /** Time.deltaTime*/;
        this.transform.position = Vector3.Lerp(this.transform.position,pos, speedMultiplayer * Time.deltaTime);
    }
}
