using UnityEngine;
using UnityEngine.AI;


/// <summary>
/// This script automatically get the random point on navmesh and move the agent to that point. 
/// On Fire the run to the point far from the player.
/// </summary>
[RequireComponent(typeof(NavMeshAgent))]
public class IntelligentAI : MonoBehaviour
{
    public enum MovementType { 
    
        IDLE,
        WALK,
        RUN
    }
    public MovementType movType = MovementType.WALK;

    private NavMeshAgent mAgent;
    [HideInInspector]
    public Animator mAnimator;
    //public GameObject clone;
    public Transform hunter;

    public int areaMask = 0;
    public float lookAheadMinRange = 4;
    public float lookAheadMaxRange = 10;

    public float walkSpeed = 3.5f;
    public float runSpeed = 7f;

    public float changePositionMinDelay = 5;
    public float changePositionMaxDelay = 5;
    float mTime = 5;

    [HideInInspector]
    private bool isDead = false;

    public bool IsDead { get => isDead; set => isDead = value; }

    private void Start()
    {
        mAgent = this.GetComponent<NavMeshAgent>();
        mAnimator = this.GetComponentInChildren<Animator>();

        //if (Toolbox.GameplayController)
        //    hunter = Toolbox.GameplayController.Player.transform;


        SetMovementType(movType);

        areaMask = 1 << NavMesh.GetAreaFromName("Walkable");
        mTime = GetRandomDelay();
    }

    void Update()
    {
        if (isDead) {
            return;
        }

        if (mAgent.speed == 0)
        {

            mTime -= Time.deltaTime;

            if (mTime <= 0)
            {

                mTime = GetRandomDelay();

                SetMovementType(MovementType.WALK);
                mAgent.SetDestination(GetRandomPointOnNavmesh());
            }
        }
        else { // not in idle state

            OnReachDestinationHandling();
        }

        //if (Input.GetMouseButtonDown(0))
        //    FireHeardHandling();


    }

    public void OnReachDestinationHandling() {
        
        if (isDead)
        {
            return;
        }

        if (mAgent.speed != walkSpeed && mAgent.remainingDistance <= (mAgent.stoppingDistance + 1)) {

            SetMovementType(MovementType.WALK);

        }else
        if (mAgent.remainingDistance <= mAgent.stoppingDistance) {

            mTime = GetRandomDelay();
            SetMovementType(MovementType.IDLE);        
        }        
    }

    public void SetMovementType(MovementType _type) {
        
        if (isDead)
        {
            return;
        }

        switch (_type) {

            case MovementType.IDLE:

                mAgent.speed = 0;
                break;

            case MovementType.WALK:

                mAgent.speed = walkSpeed;

                break;

            case MovementType.RUN:

                mAgent.speed = runSpeed;

                break;
        }

        mAnimator.SetFloat("Speed", mAgent.speed);

    }

    Vector3 GetRandomPointInRange()
    {
        Vector3 randomPoint = (Random.insideUnitSphere * lookAheadMaxRange) + transform.position;
        
        int index = 0;
        while (Vector3.Distance(this.transform.position, randomPoint) < lookAheadMinRange) {
            
            //Debug.LogError("R");
            randomPoint = (Random.insideUnitSphere * lookAheadMaxRange) + transform.position;

            index++;

            if (index > 5)
                break;
        }

        return new Vector3(randomPoint.x, 0, randomPoint.z);
    }

    Vector3 GetRandomPointOnNavmesh()
    {
        //Debug.Log("Get Point On Navmesh!");

        Vector3 randomPoint = GetRandomPointInRange();
        //Instantiate(clone, randomPoint, Quaternion.identity);

        NavMeshHit hit;
        if (NavMesh.SamplePosition(randomPoint, out hit, lookAheadMaxRange, areaMask))
        {
            return hit.position;
        }
        else {
            return this.transform.position;
        }
    }

    public void FireHeardHandling() {

        Vector3[] movePoints = {
            GetRandomPointOnNavmesh(),
            GetRandomPointOnNavmesh()
        };

        Vector3 finalPoint = GetMostFarPointFromHunter(movePoints);

        SetMovementType(MovementType.RUN);

        mAgent.SetDestination(finalPoint);
    }

    Vector3 GetMostFarPointFromHunter(Vector3[] _movePoints) {

        float maxDist = 0;
        int maxPointIndex = 0;

        for (int i = 0; i < _movePoints.Length; i++)
        {
            float dist = Vector3.Distance(_movePoints[i], hunter.position);
            //Debug.LogError("D-> " + dist);

            if (dist > maxDist) {

                maxDist = dist;
                maxPointIndex = i;
            }
        }
        //Debug.LogError("F-> " + maxPointIndex);

        return _movePoints[maxPointIndex];
    }

    private float GetRandomDelay() { 
    
        return Random.Range(changePositionMinDelay, changePositionMaxDelay);
    }

    #region GARBAGE

    //Vector3 GetClosesetEdge()
    //{
    //    Debug.Log("Taking Cover!");
    //    NavMeshHit hit;
    //    if (mAgent.FindClosestEdge(out hit))
    //        return hit.position;
    //    else
    //        return mAgent.transform.position;
    //}

    //public void InitRandomPointInRange()
    //{
    //    Vector3 randomPoint = Random.insideUnitSphere * lookAheadMaxRange;
    //    //Instantiate(new GameObject("A"), new Vector3(randomPoint.x, 0, randomPoint.z), Quaternion.identity);
    //}


    #endregion

    public void SteadyToGetShot()
    {
        SetMovementType(IntelligentAI.MovementType.IDLE);
        mTime = 7;
    }

    public void OnDeadHandling() {

        //Debug.LogError("DEAD HANDLING");
        //Debug.Break();

        mAnimator.SetTrigger("Dead");
        SetMovementType(IntelligentAI.MovementType.IDLE);
        IsDead = true;

    }
}
